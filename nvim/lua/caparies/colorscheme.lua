vim.cmd([[
  try
    " tokyonight
    " tokyodark
    " darkplus
    " dracula
    " catppuccin
  colorscheme dracula
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
