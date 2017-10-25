To Use
======
```bash
$ cd <repo clone>
$ install/bash.sh
$ install/git.sh
$ install/tmux.sh
$ install/vim.sh
```

Tmux Keyboard Shortcuts
=======================
Navigation

`prefix + h` and `prefix + C-h` - select pane on the left
`prefix + j` and `prefix + C-j` - select pane below the current one
`prefix + k` and `prefix + C-k` - select pane above
`prefix + l` and `prefix + C-l` - select pane on the right

Resizing panes

`prefix + shift + h` - resize current pane 5 cells to the left
`prefix + shift + j` - resize 5 cells in the up direction
`prefix + shift + k` - resize 5 cells in the down direction
`prefix + shift + l` - resize 5 cells to the right

Splitting panes

`prefix + |` - split current pane horizontally
`prefix + -` - split current pane vertically
`prefix + \` - split current pane full width horizontally
`prefix + _` - split current pane full width vertically

Swapping windows

`prefix + <` - moves current window one position to the left
`prefix + >` - moves current window one position to the right

VIM Keyboard Shortcuts
======================

*DWM*

`C-N` - Creates a new window and place it in the master pane [M] & stacks all previous windows in the stacked pane [S]
`C-C` - Close the current window if no unsaved changes
`C-J` - Jumps to next window (clockwise)
`C-K` - Jumps to previous window (anti-clockwise)
`C-Space` - Focus the current window, that is, place it in the master pane [M] & stacks all other windows in the stacked pane [S]


*CTRLP*
Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
Press <c-f> and <c-b> to cycle between modes.
Press <c-d> to switch to filename search instead of full path.
Press <c-r> to switch to regexp mode.
Use <c-j>, <c-k> or the arrow keys to navigate the result list.
Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
Use <c-y> to create a new file and its parent directories.
Use <c-z> to mark/unmark multiple files and <c-o> to open them.


