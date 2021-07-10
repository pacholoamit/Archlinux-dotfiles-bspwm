Config {
       font = "xft:Dejavu Sans:size=10"
       , additionalFonts = [ "xft:Font Awesome 5 Pro:size=10","xft:Technology:size=12:Regular:antialias=true","xft:Dejavu Sans:size=13","xft:Robot Crush:size=12" ]
       , allDesktops = True
    -- , textOffset = 23
       , bgColor = "#191919"
       , fgColor = "#a2a1a1"
    -- , position = Static { xpos = 0 , ypos = 0, width = 1367, height = 22 }
       , position = TopSize L 100 10
    -- , border = FullBM 0
    -- , borderColor =  "#fff"
    -- , borderWidth = 0
       , commands = [ Run Cpu [ "--template", "<fc=#5beedc><fn=1></fn></fc><fn=2> <total></fn><fn=4>%</fn>"
                              , "--Low","3"
                              , "--High","80"
                              , "--low","#a2a1a1"
                              , "--normal","#a2a1a1"
                              , "--high","#fb4934"] 50

                    , Run Memory ["-t","<fc=#5beedc><fn=1></fn></fc><fn=2> <usedratio></fn><fn=4>%</fn>"
                                 ,"-H","80"
                                 ,"-L","10"
                                 ,"-l","#a2a1a1"
                                 ,"-n","#a2a1a1"
                                 ,"-h","#fb4934"] 50

                    , Run Date "<fc=#5beedc><fn=1></fn></fc><fn=2> %I:%M</fn>" "date" 300
                    , Run DynNetwork ["-t","<fc=#5beedc><fn=1></fn></fc><fn=2> <rx> </fn><fc=#5beedc><fn=1></fn></fc><fn=2> <tx></fn>"
                                     ,"-H","200"
                                     ,"-L","10"
                                     ,"-h","#a2a1a1"
                                     ,"-l","#a2a1a1"
                                     ,"-n","#a2a1a1"] 50
                   

                    , Run ThermalZone 0 ["-t","<fn=2><temp></fn><fn=4>°</fn>"
                                   , "-L", "30"
                                   , "-H", "65"
                                   , "-l", "#a2a1a1"
                                   , "-n", "#a2a1a1"
                                   , "-h", "#fb4934"] 50

				 -- , Run ComX "iwgetid" ["-r"] "N/A" "wifi" 30
					, Run CommandReader "sh ~/.config/bspwm/panel/wifi.sh -a" "wifi"
					, Run CommandReader "amixer get Master | awk -F'[]%[]' '/%/ { print $2 }' | head -n 1 > /tmp/volume ; tail -f -q -n +0 /tmp/volume 2> /dev/null" "vol"
          , Run CommandReader "~/.config/bspwm/panel/workspaces_bspwm" "workspaces"
          , Run Com ".config/bspwm/panel/trayer-padding.sh" [] "trayer" 20
                    ]
       , sepChar = "$"
       , alignSep = "}{"
       , template = "<fc=#a2a1a1><fn=1>$trayer$<fc=#0d0d0d></fc> $date$ <fc=#0d0d0d></fc> <fc=#5beedc><fn=1></fn></fc><fn=2> $wifi$</fn> $dynnetwork$ <fc=#0d0d0d></fc> <fc=#5beedc> </fc><fn=2>$vol$</fn><fn=4>%</fn> <fc=#0d0d0d></fc> <fc=#5beedc><fn=1> </fn></fc><fn=2>$thermal0$</fn> <fc=#0d0d0d></fc> $memory$ <fc=#0d0d0d></fc> $cpu$ </fn></fc> }{ <fn=1>$workspaces$</fn>"
       }
