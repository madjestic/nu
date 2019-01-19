---
title: A quick-start with Euterpea
---

#### A guide how to set up Euterpea and make some noise.
\



We assume that you've got Euterpea installed either via cabal or a package manager, such as [portage](https://wiki.gentoo.org/wiki/Portage), if not:
```bash
     $ cabal install euterpea
```
or
```bash
     $ emerge euterpea                                                  
```
\
Let's see if it gets picked up by ghci:
```bash
     $ ghci
     GHCi, version 8.4.4: http://www.haskell.org/ghc/  :? for help
     Loaded GHCi configuration from /home/madjestic/.ghci
     Prelude Text.Show.Unicode> import Euterpea
     Prelude Text.Show.Unicode Euterpea>
```
\
Now we will use JACK to create a playback device for Euterpea to use to play musice:

- start qjackctl

- start qsynth

- run the JACK server via qjackctl interface

- run `devices` to see of Euterpea see the qsynth:
```haskell
Prelude Text.Show.Unicode Euterpea> devices

Input devices: 
  InputDeviceID 1	Midi Through Port-0

Output devices: 
  OutputDeviceID 0	Midi Through Port-0
  OutputDeviceID 2	qjackctl
  OutputDeviceID 3	Synth input port (qsynth:0)
```
We can see here that qsynth is seen by Euterpea as a device number 3.

\
Let's ask Euterpea about instruments that it can play:
```haskell
Prelude Text.Show.Unicode Euterpea> :i InstrumentName
data Message = ... | InstrumentName !String | ...
   -- Defined in ‘Codec.Midi’

   data InstrumentName
   = AcousticGrandPiano
   | BrightAcousticPiano
   | ElectricGrandPiano
   | HonkyTonkPiano
   | RhodesPiano
   ...
```
\
Finally, let's tell Euterpea to send a note to qsynth (device number 3) via JACK to play:
```haskell
playDev 3 $ instrument Clavinet $ c 4 qn
```

If all went fine, you should hear a sound being played.
\
\

Happy hacking!
