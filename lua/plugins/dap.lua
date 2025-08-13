return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_installation = true,
      ensure_installed = {
        'codelldb',
      },
    }

    dapui.setup()

    -- C/C++ configuration using codelldb
    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'codelldb',
        args = { '--port', '${port}' },
      },
    }

    dap.configurations.cpp = {
      {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
          -- Try to find common executable patterns
          local cwd = vim.fn.getcwd()
          local possible_exes = {
            cwd .. '/build/obliq',
            cwd .. '/a.out',
            cwd .. '/main',
            cwd .. '/build/main',
            cwd .. '/build/' .. vim.fn.fnamemodify(cwd, ':t'),
            cwd .. '/' .. vim.fn.fnamemodify(cwd, ':t'),
          }
          
          -- Check if any common executable exists
          for _, exe in ipairs(possible_exes) do
            if vim.fn.executable(exe) == 1 then
              return exe
            end
          end
          
          -- If no common executable found, prompt user
          return vim.fn.input('Path to executable: ', cwd .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }

    dap.configurations.c = dap.configurations.cpp

    -- Keybindings
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })
  end,
}