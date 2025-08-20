return {
    "Ramilito/kubectl.nvim",
    opts = {},
    cmd = { "Kubectl", "Kubectx", "Kubens" },
    keys = {
        {
            "<leader>k",
            '<cmd>lua require("kubectl").toggle()<cr>',
            desc = "Toggle kubectl",
        },
    },
}
