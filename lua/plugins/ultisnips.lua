return {
    {
        "SirVer/ultisnips",
        config = function()
            vim.cmd [[
                let g:UltiSnipsExpandTrigger="<tab>"
                let g:UltiSnipsJumpForwardTrigger="<tab>"
                let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
                let g:UltiSnipsSnippetDirectories=["UltiSnips"]
            ]]
        end,
    },
}
