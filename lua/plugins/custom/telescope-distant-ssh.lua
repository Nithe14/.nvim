local M = {}

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')


local function loadSshHosts()
    local sshConfigFile = os.getenv("HOME") .. '/.ssh/config'
    local hosts = {}
    local currentHost

    for line in io.lines(sshConfigFile) do
        local host = line:match('Host%s+(%S+)')
        if host then
            currentHost = host
            hosts[currentHost] = {}
        else
            local user = line:match('User%s+(%S+)')
            local hostname = line:match('HostName%s+(%S+)')
            if user and currentHost then
                hosts[currentHost].user = user
            elseif hostname and currentHost then
                hosts[currentHost].hostname = hostname
            end
        end
    end

    return hosts
end


-- Connect to the host
local function connectToSshHost(selected_host)
    if selected_host then
	local sshHosts = loadSshHosts()
	local hostToConnect = sshHosts[selected_host]
	local connection = hostToConnect.user .. "@" .. hostToConnect.hostname
	vim.api.nvim_exec(':DistantConnect ' .. connection, false)
	vim.wait(200) -- wait till the connection established
	vim.api.nvim_exec(':DistantOpen /', false)
	vim.api.nvim_exec(':TablineTabRename ' .. selected_host .. " (" .. hostToConnect.hostname .. ")", false)
    end
end

-- Open telescope picker
function M.telescopeSshHosts()
    local sshHosts = loadSshHosts()
    local hostList = {}
    for host, _ in pairs(sshHosts) do
        table.insert(hostList, host)
    end

    local entry_maker = function(entry)
        return {
            value = entry,
            display = entry,
            ordinal = entry,
        }
    end

    pickers.new({}, {
        prompt_title = 'SSH Hosts',
        finder = finders.new_table {
            results = hostList,
            entry_maker = entry_maker,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(_, map)

      	    map("i", "<CR>", function(_prompt_bufnr)
		    actions.close(_prompt_bufnr)
		    connectToSshHost(action_state.get_selected_entry(_prompt_bufnr).value)
	    end)
	    return true
        end,
    }):find()
end

return M

