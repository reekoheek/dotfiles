lua << EOF
require('telescope').setup({
	defaults = {
		layout_config = {
			prompt_position = 'top'
		},
		vimgrep_arguments = {
			'rg',
			'--ignore',
			'--hidden',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
			},
		prompt_prefix = '🔍',
		},
})
EOF
