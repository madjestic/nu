import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.StackSet
import XMonad.Layout.AvoidFloats
import XMonad.Actions.FloatSnap
import XMonad.Actions.FloatKeys
import XMonad.Actions.GridSelect
import XMonad.Hooks.Place
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Fullscreen
import XMonad.Layout.Renamed
import XMonad.Layout.Circle
import qualified XMonad.StackSet as W

myLayout =
  renamed [CutWordsLeft 1]
  $ avoidStruts
  $ spacing 0
  $   bsp
  ||| Circle
  ||| Full
  where       
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
                 [ ((mod4Mask .|. shiftMask, xK_k),     windows W.swapDown ) -- %! Swap the focused window with the next window
                 , ((mod4Mask .|. shiftMask, xK_j),     windows W.swapUp   )
                 , ((mod4Mask, xK_Tab),                 windows focusUp   >> windows shiftMaster )
--                 , ((mod4Mask .|. shiftMask, xK_Tab),   windows focusDown >> windows shiftMaster )
                 , ((mod4Mask .|. mod1Mask              , xK_k),  withFocused $ snapGrow   U Nothing)
                 , ((mod4Mask .|. mod1Mask .|. shiftMask, xK_j),  withFocused $ snapShrink U Nothing)
                 , ((mod4Mask .|. mod1Mask              , xK_j),  withFocused $ snapGrow   D Nothing)
                 , ((mod4Mask .|. mod1Mask .|. shiftMask, xK_k),  withFocused $ snapShrink D Nothing)
                 , ((mod4Mask .|. mod1Mask              , xK_h),  withFocused $ snapGrow   L Nothing)
                 , ((mod4Mask .|. mod1Mask .|. shiftMask, xK_l),  withFocused $ snapShrink L Nothing)
                 , ((mod4Mask .|. mod1Mask              , xK_l),  withFocused $ snapGrow   R Nothing)
                 , ((mod4Mask .|. mod1Mask .|. shiftMask, xK_h),  withFocused $ snapShrink R Nothing)
                 , ((mod4Mask .|. controlMask           , xK_Left),  withFocused $ snapMove   L Nothing)
                 , ((mod4Mask .|. controlMask           , xK_Right), withFocused $ snapMove   R Nothing)
                 , ((mod4Mask .|. controlMask           , xK_Up),    withFocused $ snapMove   U Nothing)
                 , ((mod4Mask .|. controlMask           , xK_Down),  withFocused $ snapMove   D Nothing)
                 , ((mod4Mask,               xK_Return), windows W.swapMaster)
                 , ((mod4Mask .|. shiftMask, xK_j     ), windows W.swapDown  )
                 , ((mod4Mask .|. shiftMask, xK_k     ), windows W.swapUp    )
                 , ((mod4Mask, xK_g), goToSelected defaultGSConfig)
                 ]
             `additionalKeysP`
                 [ ("<XF86AudioMute>"        , spawn "amixer set Master toggle")
                 , ("<XF86AudioLowerVolume>" , spawn "amixer set Master 5%-")
                 , ("<XF86AudioRaiseVolume>" , spawn "amixer set Master 5%+")
                 , ("<XF86MonBrightnessDown>", spawn "/home/madjestic/bin/brightnessdown")
                 , ("<XF86MonBrightnessUp>"  , spawn "/home/madjestic/bin/brightnessup")
                 , ("M-S-,"     , spawn "playerctl previous")
                 , ("M-S-."     , spawn "playerctl next")
                 , ("M-S-/"     , spawn "playerctl play-pause")
                 , ("M-C-c"     , spawn "chromium")
                 , ("M-C-f"     , spawn "firefox")
                 , ("M-S-C-e"   , spawn "emacs")
                 , ("M-C-e"     , spawn "emacsclient -c")
                 , ("M-C-k"     , spawn "krusader")
                 , ("M-C-d"     , spawn "dolphin")
                 , ("M-C-s"     , spawn "spotify")
                 , ("<Print>"   , spawn "spectacle")
                 , ("M-C-<Esc>" , spawn "htop")
                 , ("M-C-l"     , spawn "slock")
                 , ("M-C-h"     , spawn "houdini")
                 , ("M-i"       , spawn "xcalib -invert -alter")
                 , ("M-s"       , sendMessage $ Swap)
                 , ("M-M1-s"    , sendMessage $ Rotate)
                 , ("M-r"       , sendMessage $ RotateL)
                 , ("M-S-r"     , sendMessage $ RotateR)
                 , ("M-a"       , sendMessage $ Balance)
                 , ("M-M1-a"    , sendMessage $ Equalize)
                 , ("M-<Left>"  , sendMessage $ ShrinkFrom R)
                 , ("M-<Right>" , sendMessage $ ExpandTowards R)
                 , ("M-<Up>"    , sendMessage $ ShrinkFrom D)
                 , ("M-<Down>"  , sendMessage $ ExpandTowards D)
                 , ("M-M1-<Left>"   , sendMessage $ ExpandTowards L)
                 , ("M-M1-<Right>"  , sendMessage $ ShrinkFrom L)
                 , ("M-M1-<Up>"     , sendMessage $ ExpandTowards U)
                 , ("M-M1-<Down>"   , sendMessage $ ShrinkFrom U)
                 ]              
