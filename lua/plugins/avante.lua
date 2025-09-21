return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
        providers = {
            copilot = {
                endpoint = "https://api.githubcopilot.com",
                model = "gpt-4o",
                disable_tools = false,
                extra_request_body = {
                    max_tokens = 8192,
                },
            },
            gemini = {
                model = "gemini-2.0-flash-001",
                disable_tools = false,
            },
            huggingface = {
                __inherited_from = "openai",
                endpoint = "https://router.huggingface.co/v1",
                model = "Qwen/Qwen3-Coder-480B-A35B-Instruct",
                api_key_name = "HF_TOKEN",
            },
            ollama = {
                host = "http://localhost:11434",
                model = "qwen2.5-coder:3b",
                disable_tools = false,
                -- timeout = 3000,
                -- extra_request_body = {
                --     options = {
                --         num_ctx = 4096,
                --     },
                -- },
            },
            openrouter = {
                __inherited_from = "openai",
                endpoint = "https://openrouter.ai/api/v1",
                model = "qwen/qwen3-coder:free",
                api_key_name = "OPENROUTER_API_KEY",
            },
        },
        provider = "copilot",
        auto_suggestions_provider = "copilot",
        behaviour = {
            auto_focus_sidebar = true,
            auto_suggestions = false,
            auto_suggestions_respect_ignore = true,
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = true,
            jump_result_buffer_on_finish = false,
            support_paste_from_clipboard = false,
            minimize_diff = true,
            enable_token_counting = true,
            use_cwd_as_project_root = true,
            auto_focus_on_diff_view = false,
            ---@type boolean | string[] -- true: auto-approve all tools, false: normal prompts, string[]: auto-approve specific tools by name
            auto_approve_tool_permissions = false, -- Default: show permission prompts for all tools
            auto_check_diagnostics = true,
        },
        suggestion = {
            debounce = 300,
        },
        mappings = {
            --- @class AvanteConflictMappings
            diff = {
                ours = "co",
                theirs = "ct",
                all_theirs = "ca",
                both = "cb",
                cursor = "cc",
                next = "]x",
                prev = "[x",
            },
            suggestion = {
                accept = "<M-l>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
            jump = {
                next = "]]",
                prev = "[[",
            },
            submit = {
                normal = "<CR>",
                insert = "<C-s>",
            },
            cancel = {
                normal = { "<C-c>", "<Esc>", "q" },
                insert = { "<C-c>" },
            },
            sidebar = {
                apply_all = "A",
                apply_cursor = "a",
                retry_user_request = "r",
                edit_user_request = "e",
                switch_windows = "<Tab>",
                reverse_switch_windows = "<S-Tab>",
                remove_file = "d",
                add_file = "@",
                close = { "<Esc>", "q" },
                close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
            },
        },
        system_prompt = function()
            -- 1) Get your MCP hub prompt
            local hub = require("mcphub").get_hub_instance()
            local hub_prompt = hub and hub:get_active_servers_prompt() or ""

            -- 2) Load default rules
            local rules = ""
            local rules_path = vim.fn.stdpath("config")
                .. "/avanterules/default.avanterules"
            local file = io.open(rules_path, "r")
            if file then
                rules = file:read("*a")
                file:close()
            else
                vim.notify(
                    "Avante: could not read rules at " .. rules_path,
                    vim.log.levels.WARN
                )
            end

            -- 3) Combine and return
            if rules ~= "" then
                return hub_prompt .. "\n\n" .. rules
            else
                return hub_prompt
            end
        end,
        custom_tools = function()
            return {
                require("mcphub.extensions.avante").mcp_tool(),
            }
        end,
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-mini/mini.pick", -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        "MeanderingProgrammer/mcphub.nvim", -- for Motion Canvas Project integration
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
