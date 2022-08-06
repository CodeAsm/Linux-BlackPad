# Linux-BlackPad
My Lenovo linux settings, Awesome configs and such, ofcourse all the public stuff like wallpapers, layout settings and wpa passwords... wait, no, I hope not that last part :D

## Idea
Make this more general, as i will move laptops, and thus will not be Lenovo specific. I already use this on a Acer netbook aswell.

## Log
Removed some folders and unused scripts
Changed the scripts to how they are now.

Added windows 2000 support in qemu, windows start script
Added xemu and xqemu usb memory option note
changed Virtbridge to include an option to choose the ip range before making a bridge


##  Added ignore list 
So I whitelist the files that need updating :D (there is probably 100 other better ways to do this... why do I even care to share my configs?)

# Usage
Ive decided to git clone this directory in the projects folder and manualy symlink folders to where they belong and files to their recpectable places, to make it more easely maintainable without breaking other git folders I have.

```
$ mkdir Projects
$ cd ~/Projects
$ git clone git@github.com:CodeAsm/Linux-BlackPad.git
$ ln -s /home/codeasm/Projects/Linux-BlackPad/scripts/ scripts
```




