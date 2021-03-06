SoundJS
========

`SoundJS` is a library that provides browsers with a JavaScript sound API
that first tries audio files with native HTML5 Audio and falls back to Flash
when necessary.

Specifically, the `SoundJS` API offers the ability to play the same sound
file more than once at a time, even while the same sound is already playing.
This is also known as multi-layering sounds. 

### Motivation: ###

`SoundJS` is specifically created for the
[Simple Game Framework](http://www.simplegameframework.com) HTML engine. HTML5
Audio is a nice idea, but the spec provides no multi-layering support, meaning
a single `<audio>` instance can only play it's `src` once at a time. There's
also the case where no native HTML5 Audio is supported, or the specific file
type is not supported, and that's where Flash can come in behind the scenes.

### Features: ###

 * Provides a simple API to load sounds initially, and create _play instances_
 when the sound has enough data to start playing or has loaded completely.
 * First attempts to use native HTML5 Audio to load and play back the sound.
 * Falls back to Flash when HTML5 fails or is not implemented.
 * Multi-layering loaded sounds, for multiple bullet shot sounds for example.
 * Guarantees cross-browser support for MP3, OGG Vorbis, and uncompressed WAV!
 H.264 works on HTML5 browsers that support it (no Flash fallback _yet_).

### Example Usage: ###

    var shot = new Sound("shot.mp3");
    shot.addEventListener("loaded", function() {
        function playShot() {
            shot.play();
        }
        playShot();
        setTimeout(playShot, 50);
        setTimeout(playShot, 234);
    });

View the [full API docs](http://github.com/TooTallNate/SoundJS/blob/master/API.md)
for the complete picture.

#### Building Flash Source and Minimizing JavaScript ####

A few dependencies are required in order to build the source code into a Flash
compatible SWF, and minimize
([Compile](http://code.google.com/closure/compiler/)) the JavaScript source.
Make sure that you have installed:

 * [HaXe 'haxe' compiler command](http://haxe.org/)
 * [Node.js 'node' command](http://nodejs.org)

Once the dependencies are met, you can simply run:

    ./compile

from the root directory. `compile` is a simple script written in JavaScript
using Node.js as the interpreter. It first uses the Google Compiler web
service to minimize the JavaScript code, then uses the `haxe` command line
tool to compile the HaXe source into a Flash SWF file.

#### License ####

`SoundJS` incorporates some Flash libraries licensed under the
[LGPL license](http://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License),
`SoundJS` must be released as LGPL as well.

See the [`COPYING.LESSER`](http://github.com/TooTallNate/SoundJS/blob/master/COPYING.LESSER)
file for full legal text.
