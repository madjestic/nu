import XMonad
import XMonad.Layout.Fullscreen
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig  
import qualified XMonad.StackSet as W       

main = do
     xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
     xmonad $ defaultConfig
                 { manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
                 , layoutHook = avoidStruts $ layoutHook defaultConfig
                 , logHook    = dynamicLogWithPP xmobarPP
                                    { ppOutput = hPutStrLn xmproc
                                    , ppTitle = xmobarColor "SpringGreen" "" . shorten 80
                                    }
                 , terminal   = "urxvt"
                 , modMask    = mod4Mask
                 , focusedBorderColor 	= "SeaGreen"
                 , borderWidth		= 2
                 }
             `additionalKeys`
                 [ ((mod4Mask .|. shiftMask, xK_k     ), windows W.swapDown  ) -- %! Swap the focused window with the next window
                 , ((mod4Mask .|. shiftMask, xK_j     ), windows W.swapUp    )
                 ]
             `additionalKeysP`
                 [ ("<XF86AudioMute>"        , spawn "amixer set Master toggle")
                 , ("<XF86AudioLowerVolume>" , spawn "amixer set Master 5-")
                 , ("<XF86AudioRaiseVolume>" , spawn "amixer set Master 5+")
                 , ("<XF86MonBrightnessDown>", spawn "/home/madjestic/bin/brightnessdown")
                 , ("<XF86MonBrightnessUp>"  , spawn "/home/madjestic/bin/brightnessup")
                 , ("M-S-,"    , spawn "playerctl previous")
                 , ("M-S-."    , spawn "playerctl next")
                 , ("M-S-/"    , spawn "playerctl play-pause")
                 , ("M-C-c"    , spawn "chromium")
                 , ("M-S-C-e"  , spawn "emacs")
                 , ("M-C-e"    , spawn "emacsclient -c")
                 , ("M-C-d"    , spawn "dolphin")
                 , ("M-C-k"    , spawn "krusader")
                 , ("M-C-s"    , spawn "spotify")
                 , ("<Print>"  , spawn "ksnapshot")
                 , ("M-C-<Esc>", spawn "ksysguard")
                 , ("M-C-l"    , spawn "slock")
                 , ("M-C-h"    , spawn "houdini")
                 ]              
