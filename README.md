<p align="center">
<img src="https://github.com/yezz123/yezz123/blob/master/img/img.gif">
</p>

## dotfiles

These are Yezz123's dotfiles.  They may not be that useful to you, but they are useful to him!

To begin, clone this repo into your home directory.

```
$ git clone https://github.com/yezz123/dotfiles.git .dotfiles
```

### contributing

To add a new section to the .dotfiles, create a directory with all the assets that you'll need.  The file that will be invoked by the installer is always called `install.sh`.  To ensure that the installation happens at the right time, just pop a line with the name of the directory into `scripts/utils/install_checklist`.
