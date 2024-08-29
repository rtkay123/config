local M = require('config.custom.dap.node');
M.node_dap()

require("dap").configurations.svelte = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
