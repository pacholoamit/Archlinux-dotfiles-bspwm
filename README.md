# Archlinux-dotfiles-bspwm

Glorious archlinux dotfiles repository for a glorious BSPWM desktop environment set up.

![image](https://user-images.githubusercontent.com/69985528/124698871-57cc0980-df1c-11eb-9ea6-e02543909292.png)

![image](https://user-images.githubusercontent.com/69985528/124699391-4a634f00-df1d-11eb-9d26-de7ccadc0e78.png)

## Details:

- `Terminal`: alacritty
- `Window manager`: bspwm (Tiling window manager)
- `Compositor`: picom (for transparency & window border radius)
- `Polybar`: Top appbar (w/ dual monitor support)
- `App menu`: Rofi (nord theme)
- `Navigation control`: sxhkd (should come with bspwm)
- `Terminal emulator`: zsh & ohmyzsh (should be contained in .zshrc)

## Installation & usage:

You may install using the various methods listed below

## `Option 1: easy install using GNU/stow`

Note: Make sure the directories of the config files are deleted before running the stow command.
Example if you were to use my `alacritty` settings. Make sure you delete the`~/.config/alacritty`
directory otherwise you'll have errors.

```bash
cd ~

git clone https://github.com/pacholoamit/Archlinux-dotfiles-bspwm.git

cd Archlinux-dotfiles-bspwm

stow <package> # I.E `stow alacritty` to use the alacritty config I have

OR

# You may chain packages using the stow command

stow alacritty/ bspwm/ ....

```

The `stow` command creates a symlink between the file in the repository and your pc. For example, running:

```
stow alacritty/
```

will copy the alacritty config files in your `~/.config/alacritty` directory. If for some reason your config files are placed elsewhere you may use the next option of install.

## `Options 2: manual install`

```bash
cd ~

git clone https://github.com/pacholoamit/Archlinux-dotfiles-bspwm.git

cd Archlinux-dotfiles-bspwm

mv alacritty ~/.config  # The 2nd argument is where you want to move your files to
                        # OR just copy and paste it

```

## Polybar additional set up

Keep in mind this is a dual-monitor set up. Some additional edits to the config file will need to be done on the Polybar config files located at `polybar/.config/polybar/config`.

### `Dual monitors`

For polybar `config` set up:

```bash
cd Archlinux-dotfiles-bspwm


xrandr -q | grep -w connected  # To get your monitor outputs

# Exxample output:
# DisplayPort-0 connected 1920x1080+1920+0 (normal left inverted right x axis y axis) 476mm x 268mm
# HDMI-A-0 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 531mm x 299mm

micro polybar/.config/polybar/config

# Go to Line 26 for your primary monitor

[bar/top]
enable-ipc = true
monitor = HDMI-A-0 # <--- Primary monitor here
width = 100%
height = 24

# Go to Line 86 for your secondary monitor

[bar/top_external]
enable-ipc = true
monitor = DisplayPort-0 # <--- Secondary monitor here
width = 100%
height = 24

Then restart polybar/bspwm
```

For `bspwmrc` set up:

```bash
cd Archlinux-dotfiles-bspwm

micro bspwm/.config/bspwm/bspwmrc

#Delete line 6
# Set dual monitors
xrandr --output HDMI-A-0 --primary --rotate normal --output DisplayPort-0 --rotate normal --right-of HDMI-A-0 &

#Change line 38 & 39 to your desktop set up

bspc monitor HDMI-A-0 -d "1  " "2  " "3  " "4  " "5  " "6  " "7  "
bspc monitor DisplayPort-0 -d "8  "  "9  " "10  "


```

### `Single monitor

For single monitor you'll need to edit both the polybar `config` file &
`bspwmrc` file

For polybar `config` set up:

```bash
cd Archlinux-dotfiles-bspwm


xrandr -q | grep -w connected  # To get your monitor outputs

# Exxample output:
# DisplayPort-0 connected 1920x1080+1920+0 (normal left inverted right x axis y axis) 476mm x 268mm

micro polybar/.config/polybar/config

# Go to Line 26 for your primary monitor

[bar/top]
enable-ipc = true
monitor = HDMI-A-0 # <--- Primary monitor here
width = 100%
height = 24

Delete [bar/top_external] So delete everything from Line 84 to 142

Then restart polybar/bspwm

```

For `bspwmrc` set up:

```bash
cd Archlinux-dotfiles-bspwm

micro bspwm/.config/bspwm/bspwmrc

#Delete line 6

xrandr --output HDMI-A-0 --primary --rotate normal --output DisplayPort-0 --rotate normal --right-of HDMI-A-0 &

# Delete line 38 & 39

bspc monitor HDMI-A-0 -d "1  " "2  " "3  " "4  " "5  " "6  " "7  "
bspc monitor DisplayPort-0 -d "8  "  "9  " "10  "

# Add this instead:

bspc monitor -d "1  " "2  " "3  " "4  " "5  " "6  " "7  " "8  "  "9  " "10  "
```
