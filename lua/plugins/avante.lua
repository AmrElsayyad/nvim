return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
        providers = {
            copilot = {
                model = "claude-sonnet-4",
                extra_request_body = {
                    max_tokens = 8192,
                },
            },
            gemini = {
                model = "gemini-2.0-flash",
            },
            ollama = {
                model = "qwen2.5-coder:3b",
                timeout = 3000,
                extra_request_body = {
                    options = {
                        num_ctx = 4096,
                    },
                },
            },
        },
        provider = "copilot",
        auto_suggestions_provider = "gemini",
        behaviour = {
            auto_suggestions = true,
        },
        suggestion = {
            debounce = 300,
        },
        system_prompt = function(opts)
            -- 1) Get your MCP hub prompt
            local hub = require("mcphub").get_hub_instance()
            local hub_prompt = hub and hub:get_active_servers_prompt() or ""

            -- 2) Load mode-specific rules based on current mode
            local rules = ""
            if opts and opts.mode then
                local rules_path = vim.fn.expand(
                    "~/.config/nvim/avanterules/default."
                        .. opts.mode
                        .. ".avanterules"
                )
                local file = io.open(rules_path, "r")
                if file then
                    rules = file:read("*a")
                    file:close()
                else
                    vim.notify(
                        "Avante: could not read "
                            .. opts.mode
                            .. " rules at "
                            .. rules_path,
                        vim.log.levels.WARN
                    )
                end
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
        "echasnovski/mini.pick", -- for file_selector provider mini.pick
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
