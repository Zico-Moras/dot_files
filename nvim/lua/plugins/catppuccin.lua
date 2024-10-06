return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, 
	config = function()
		 require("catppuccin").setup({
                transparent_background = true,  -- Enable transparency
                term_colors = true,  -- Use terminal colors
                styles = {
                    comments = { "italic" },
                    functions = { "bold" },
                    keywords = { "bold" },
                    strings = { "italic" },
                    variables = { "italic" },
                },
            })
		vim.cmd.colorscheme "catppuccin"
	end
}
