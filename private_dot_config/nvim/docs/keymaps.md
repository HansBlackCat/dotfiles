# Keymaps

---

### [Comment.nvim](https://github.com/numToStr/Comment.nvim)

#### Basic mapping

##### normal mode

```
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
```

##### visual mode

```
`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment
```

#### Extra mapping

##### normal mode

```
`gco` - Insert comment to the next line and enters INSERT mod
`gcO` - Insert comment to the previous line and enters INSERT mode
`gcA` - Insert comment to end of the current line and enters INSERT mode
```

##### visual mode

```
# Linewise

`gcw` - Toggle from the current cursor position to the next word
`gc$` - Toggle from the current cursor position to the end of line
`gc}` - Toggle until the next blank line
`gc5j` - Toggle 5 lines after the current cursor position
`gc8k` - Toggle 8 lines before the current cursor position
`gcip` - Toggle inside of paragraph
`gca}` - Toggle around curly brackets

# Blockwise

`gb2}` - Toggle until the 2 next blank line
`gbaf` - Toggle comment around a function (w/ LSP/treesitter support)
`gbac` - Toggle comment around a class (w/ LSP/treesitter support)
```

---

### [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim#pickers)

```
`\ff` - Find files
`\fg` - Search with (rip)grep
`\fb` - Find buffers
`\fh` - Find help tags
`\fn` - Find notify log (TODO)
```

---

### [surround.vim](https://github.com/tpope/vim-surround)

```
`cs<from><to>` - Change surroundings
  example) "Hello" - cs"' -> 'Hello'
`ds<toRemove>` - Remove surroungings
`ysiw<to>`     - Surround word (`iw` is a text object)
`yss<to>`      - Surround sentence (`s` is a sentence)
```
