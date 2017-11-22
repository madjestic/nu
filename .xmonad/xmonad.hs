import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Fullscreen
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.Run
import qualified XMonad.StackSet as W

myLayout = renamed [CutWordsLeft 2]
         $ avoidStruts
         $ spacing 0
         $   bsp
         ||| tall
         ||| Full
         ||| mirror
             where tall   = Tall 1 (3/100) (1/2)
                   mirror = Mirror tall
                   bsp    = renamed [Replace "BSP"] emptyBSP
          
main = do
     xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
     xmonad $ docks $ def
                 { manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook def
                 , layoutHook = myLayout
                 , logHook    = dynamicLogWithPP xmobarPP
                                    { ppOutput = hPutStrLn xmproc
                                    , ppTitle = xmobarColor "SpringGreen" "" . shorten 80
                                    }
                 , terminal   = "urxvt"
                 , modMask    = mod4Mask
                 , focusedBorderColor   = "#444444" --"SeaGreen"
                 , normalBorderColor    = "SeaGreen"
                 , borderWidth          = 2
                 }
             `additionalKeys`
                 [ ((mod4Mask .|. shiftMask, xK_k     ), windows W.swapDown  ) -- %! Swap the focused window with the next window
                 , ((mod4Mask .|. shiftMask, xK_j     ), windows W.swapUp    )
                 , ((mod4Mask,               xK_a)    , sendMessage Balance )
                 , ((mod4Mask .|. shiftMask, xK_a)    , sendMessage Equalize)
                 ]
             `additionalKeysP`
                 [ ("<XF86AudioMute>"        , spawn "amixer set Master toggle")
                 , ("<XF86AudioLowerVolume>" , spawn "amixer set Master 5%-")
                 , ("<XF86AudioRaiseVolume>" , spawn "amixer set Master 5%+")
                 , ("<XF86MonBrightnessDown>", spawn "/home/madjestic/bin/brightnessdown")
                 , ("<XF86MonBrightnessUp>"  , spawn "/home/madjestic/bin/brightnessup")
                 , ("M-S-,"    , spawn "playerctl previous")
                 , ("M-S-."    , spawn "playerctl next")
                 , ("M-S-/"    , spawn "playerctl play-pause")
                 , ("M-C-c"    , spawn "chromium")
                 , ("M-C-f"    , spawn "firefox")
                 , ("M-S-C-e"  , spawn "emacs")
                 , ("M-C-e"    , spawn "emacsclient -c")
                 , ("M-C-k"    , spawn "krusader")
                 , ("M-C-d"    , spawn "dolphin")
                 , ("M-C-s"    , spawn "spotify")
                 , ("<Print>"  , spawn "spectacle")
                 , ("M-C-<Esc>", spawn "htop")
                 , ("M-C-l"    , spawn "slock")
                 , ("M-C-h"    , spawn "houdini")
                 , ("M-i"      , spawn "xcalib -invert -alter")
                 , ("M-r"      , sendMessage $ Rotate) 
                 ]              
