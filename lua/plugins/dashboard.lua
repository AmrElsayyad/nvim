return {
    "folke/snacks.nvim",
    opts = {
        dashboard = {
            width = 60,
            row = nil, -- dashboard position. nil for center
            col = nil, -- dashboard position. nil for center
            pane_gap = 4, -- empty columns between vertical panes
            -- These settings are used by some built-in sections
            preset = {
                -- Used by the `header` section
                header = [[

           █                           █
        █  █  █                      █ █
      ███  █  █    ███   ███   ████  █ █
      █ █  █  █      █   █ █      █  █ █
      █████████    ███████████████████ █
]],
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
    },
}
