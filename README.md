# zx_fps_counter 
by Arda Erdikmen

A cycle exact frame number counter to test emulator render performance


Requires Sinclair Zx Spectrum computer with at least 48kb memory (or equivalent emulator).

Compile and create a loadable tape file with pasmo:
pasmo.exe -v --tapbas fpscounter2.asm fpscounterout2.tap

There are two different versions. The screenshot shows the second one. Below image is a 50fps gif image.

![Fps Counter Screenshot](https://github.com/ref-xx/zx_fps_counter/blob/main/fpscounter_screenrecord.gif?raw=true)

it shoud look like this. (if your computer/browser cannot play 50fps gif, it should flicker and you should see red/green borders and other visual artifacts etc.)

# How to use?

## Borders:
upper part of the border should switch colors according to zx spectrum series, black to white.
lower part of border should switch between red and yellow, producing a shade of orange colour. If you see a red or green border, your emulator skips frames.

## Bitmap:
Topmost part of screen shows frame number, 1 to 50.
Middle part of screen shows short horizontal lines, switching position. They should look like grayish long horizontal line. If you sense they are moving through a direction, your emulator might skip frames.
Bottom part of screen shows alternating checker pattern. If you see any kind of flashing at that area, it's a frame skip.

## Video Test
Best way to test your emulator is with using a hi-framerate video recorder. Use your smartphone's slow-mo 240fps recorder. Record a couple of seconds of footage. Watch and observe your emulator performance.



