----------------------------------------------------------------------------
-- DAP virtual text
----------------------------------------------------------------------------
local M = {}

function M.setup()
  require('dap-go').setup()
  require("dap-python").setup("/Users/dzyla/.pyenv/versions/neovim/bin/python")
  require('dapui').setup({
      	layouts = {
  		{
  			elements = {
  				{ id = "scopes", size = 0.25 },
  				{ id = "breakpoints", size = 0.25 },
  				{ id = "stacks", size = 0.25 },
  				{ id = "watches", size = 0.25 },
  			},
  			size = 40,
  			position = "left",
  		},
  		{
  			elements = {},
  			size = 10,
  			position = "bottom",
  		},
  	},
  })

  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function ()
      dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function ()
      dapui.close()
  end

  dap.listeners.before.event_exit["dapui_config"] = function ()
      dapui.close()
  end
end

return M
