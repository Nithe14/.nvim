require('distant'):setup({
	['network.private'] = true,
	network = {
		unix_socket = '/home/nithe/.cache/nvim/distant.nvim/nvim.sock'
	},
	servers = {
        ['*'] = {
            connect = {
                default = {
                    scheme = 'ssh',
		    options = 'ssh.user_known_hosts_files=/home/nithe/.ssh/known_hosts'
                }
            }
        }
    },
    keymap = {
        dir = {
	    enabled = true,
            up = 'h',
	    edit = 'l', '<Return>'
        }
    },
    buffer = {
        watch = {
            enabled = true
        }
    }
})

vim.keymap.set('n', '<leader>d', [[ :Distant<CR>:lua vim.wait(1)<CR>:17<CR> ]], {})
vim.keymap.set('n', '<leader>o', ':DistantOpen .<CR>', {})
