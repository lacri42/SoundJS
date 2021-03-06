/**
 * Copyright (c) 2010 Nathan Rajlich
 * 
 * This file is part of SoundJS.
 * 
 * SoundJS is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 3 of
 * the License, or (at your option) any later version.
 * 
 * SoundJS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with SoundJS.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;
import ru.etcs.events.WaveSoundEvent;
import ru.etcs.media.WaveSound;

class WAV extends Sound {
    private var wave : WaveSound;
    
    public function new(url:URLRequest) {
        super();
        wave = new WaveSound(url);
        wave.addEventListener(Event.OPEN, onOpen);
        wave.addEventListener(Event.COMPLETE, onLoaded);
        wave.addEventListener(ProgressEvent.PROGRESS, onProgress);
        //wave.addEventListener(WaveSoundEvent.DECODE_ERROR, onDecodeError);
        wave.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
        //wave.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHttpStatus);
    }
    
    public override function play(offset:Float, volume:Float, pan:Float) : SoundChannel {
        return new WAVChannel(this.wave, offset, volume, pan);
    }
    
    public override function getLength() : Float {
        return this.wave.length;
    }
    
    private function onOpen(e) {
        dispatchEvent(new SoundEvent(SoundEvent.OPEN));
    }

    private function onLoaded(e) {        
        dispatchEvent(new SoundEvent(SoundEvent.LOADED));
    }
    
    private function onIoError(e) {
        dispatchEvent(new SoundEvent(SoundEvent.ERROR));
    }

    private function onProgress(e) {
        dispatchEvent(new SoundEvent(SoundEvent.PROGRESS));
    }
}
