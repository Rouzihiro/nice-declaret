require('rose-pine').setup({
    disable_background = true
})

function ColorMyPencils(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)

    if vim.g.neovide then
        -- Put anything you want to happen only in Neovide here
        vim.api.nvim_set_hl(0, "Normal", { bg = "#181818" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181818" })
        vim.g.neovide_transparency = 0.9
    else
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

ColorMyPencils()
