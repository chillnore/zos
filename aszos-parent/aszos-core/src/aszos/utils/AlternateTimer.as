////////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2013 keyhom.c@gmail.com.
//
// This software is provided 'as-is', without any express or implied warranty.
// In no event will the authors be held liable for any damages arising from
// the use of this software.
//
// Permission is granted to anyone to use this software for any purpose
// excluding commercial applications, and to alter it and redistribute it
// freely, subject to the following restrictions:
//
//     1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//
//     2. Altered source versions must be plainly marked as such, and must not
//     be misrepresented as being the original software.
//
//     3. This notice may not be removed or altered from any source
//     distribution.
//
////////////////////////////////////////////////////////////////////////////////

package aszos.utils {

import flash.utils.getTimer;

/**
 * A timer implementation from IReadOnlyTimer.
 *
 * @author keyhom 
 */
public class AlternateTimer implements IReadOnlyTimer {
    
    /** @private */
    private static const TIMER_RESOLUTION:Number = 1000;
    /** @private */
    private static const INVERSETIMER_RESOLUTION:Number = 1.0 / TIMER_RESOLUTION;
    
    /**
     * Creates an AlternateTimer instance.
     */
    public function AlternateTimer() {
        _startTime = getTimer();
        _fps = 0;
        _tpf = 0;
        _startTime = 0;
        _previousTime = 0;
    }
    
    /** @private */
    private var _startTime:Number;
    /** @private */
    private var _previousTime:Number;
    
    /**
     * @inheritDoc
     */
    public function get timeInSeconds():Number {
        return time * INVERSETIMER_RESOLUTION;
    }
    
    /** @private */
    private var _time:Number;
    
    /**
     * @inheritDoc
     */
    public function get time():Number {
        return _time;
    }
    
    /**
     * @inheritDoc
     */
    public function get resolution():Number {
        return TIMER_RESOLUTION;
    }
    
    /** @private */
    private var _fps:Number;
    
    /**
     * @inheritDoc
     */
    public function get frameRate():Number {
        return _fps;
    }
    
    /** @private */
    private var _tpf:Number;
    
    /**
     * @inheritDoc
     */
    public function get timePerFrame():Number {
        return _tpf;
    }
    
    /**
     * Updates this timer.
     */
    public function update():void {
        _time = getTimer() - _startTime;
        _tpf = (_time - _previousTime) * INVERSETIMER_RESOLUTION;
        if (0 == _fps)
            _fps = 1.0 / _tpf;
        else
            _fps = (_fps + 1.0 / _tpf) / 2;
        _previousTime = _time;
    }
    
    /**
     * Resets this timer.
     */
    public function reset():void {
        _startTime = getTimer();
        _previousTime = _time;
    }
}
}
// vim:ft=as3
