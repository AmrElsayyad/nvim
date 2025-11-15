return {
    "mfussenegger/nvim-jdtls",
    opts = function()
        local JAVA_HOME = "/home/amr/.jenv/versions/21"
        local JAVA_BIN = JAVA_HOME .. "/bin/java"
        local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
        local launcher = vim.fn.glob(
            vim.fn.stdpath("data")
                .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
        )
        local config_dir = mason_path .. "/config_linux"

        local cmd = {
            JAVA_BIN,
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xms1g",
            "-javaagent:" .. vim.fn.expand("$MASON/share/jdtls/lombok.jar"),
            "-jar",
            launcher,
            "-configuration",
            config_dir,
            -- "-data" will be added in full_cmd per project
        }

        return {
            cmd = cmd,
            cmd_env = {
                JAVA_HOME = JAVA_HOME,
                PATH = JAVA_HOME .. "/bin:" .. vim.env.PATH,
            },
            root_dir = function(fname)
                return vim.fs.root(fname, vim.lsp.config.jdtls.root_markers)
            end,
            project_name = function(root_dir)
                return root_dir and vim.fs.basename(root_dir)
            end,
            jdtls_config_dir = function(project_name)
                return vim.fn.stdpath("cache")
                    .. "/nvim/jdtls/"
                    .. project_name
                    .. "/config"
            end,
            jdtls_workspace_dir = function(project_name)
                return vim.fn.stdpath("cache")
                    .. "/nvim/jdtls/"
                    .. project_name
                    .. "/workspace"
            end,
            full_cmd = function(opts)
                local fname = vim.api.nvim_buf_get_name(0)
                local root = opts.root_dir(fname)
                local proj = opts.project_name(root)
                local base_cmd = vim.deepcopy(opts.cmd)
                if proj then
                    vim.list_extend(base_cmd, {
                        "-data",
                        opts.jdtls_workspace_dir(proj),
                    })
                end
                return base_cmd
            end,
            settings = {
                java = {
                    home = JAVA_HOME,
                    inlayHints = {
                        parameterNames = { enabled = "all" },
                    },
                    configuration = {
                        runtimes = {
                            {
                                name = "JavaSE-21",
                                path = JAVA_HOME,
                                default = true,
                            },
                        },
                    },
                },
            },
        }
    end,
}
