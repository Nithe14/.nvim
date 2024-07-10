local builtin = require('telescope.builtin')
local ssh = require('plugins.custom.telescope-distant-ssh')
local arachne_addons = require('plugins.custom.arachne-addons')
local cdproject = require("cd-project.adapter.telescope")
require("search").setup({
  mappings = { -- optional: configure the mappings for switching tabs (will be set in normal and insert mode(!))
    next = "<Tab>",
    prev = "<S-Tab>"
  },
  append_tabs = { -- append_tabs will add the provided tabs to the default ones
    {
      "Projects",
      cdproject.cd_project
    },
    {
      "Commits", -- or name = "Commits"
      builtin.git_commits, -- or tele_func = require('telescope.builtin').git_commits
      available = function() -- optional
        return vim.fn.isdirectory(".git") == 1
      end
    },
    {
      "SSH",
      ssh.telescopeSshHosts
    },
    {
      "Notes",
      arachne_addons.find_files
    }
  },
  collections = {
    -- Here the "git" collection is defined. It follows the same configuraton layout as tabs.
    git = {
      initial_tab = 1, -- Git branches
      tabs = {
        { name = "Branches", tele_func = builtin.git_branches },
        { name = "Commits", tele_func = builtin.git_commits },
        { name = "Stashes", tele_func = builtin.git_stash },
      }
    }
  }

})
local search = require("search")
vim.keymap.set('n', '<leader>ff', search.open, {})
