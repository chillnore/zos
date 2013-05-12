/*
 * Copyright (c) 2013 keyhom.c@gmail.com.
 *
 * This software is provided 'as-is', without any express or implied warranty.
 * In no event will the authors be held liable for any damages arising from
 * the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose
 * excluding commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 *     1. The origin of this software must not be misrepresented; you must not
 *     claim that you wrote the original software. If you use this software
 *     in a product, an acknowledgment in the product documentation would be
 *     appreciated but is not required.
 *
 *     2. Altered source versions must be plainly marked as such, and must not
 *     be misrepresented as being the original software.
 *
 *     3. This notice may not be removed or altered from any source
 *     distribution.
 */

package aszos.utils {

import flash.utils.getTimer;

/**
 * A timer implementation from IReadOnlyTimer.
 *
 * @author keyhom 
 */
public class AlternateTimer implements IReadOnlyTimer {

    /** @private */
    private static const _TIMER_RESOLUTION:Number = 1000;
    /** @private */
    private static const _INVERSE_TIMER_RESOLUTION:Number = 1.0 / _TIMER_RESOLUTION;

    /**
     * Creates an AlternateTimer instance.
     */
    public function AlternateTimer() {
        _startTime = getTimer();
    }

    private var _startTime:Number = 0;
    private var _previousTime:Number = 0;
    private var _tpf:Number = 0;
    private var _fps:Number = 0;

    /**
     * @inheritDoc
     */
    public function get timeInSeconds():Number {
        return time * _INVERSE_TIMER_RESOLUTION;
    }

    /**
     * @inheritDoc
     */
    public function get time():Number {
        return getTimer() - _startTime;
    }

    /**
     * @inheritDoc
     */
    public function get resolution():Number {
        return _TIMER_RESOLUTION;
    }

    /**
     * @inheritDoc
     */
    public function get frameRate():Number {
        return _fps;
    }

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
        const t:Number = time;
        _tpf = (t - _previousTime) * _INVERSE_TIMER_RESOLUTION;
        _fps = 1.0 / _tpf;
        _previousTime = t;
    }

    /**
     * Resets this timer.
     */
    public function reset():void {
        _startTime = getTimer();
        _previousTime = time;
    }
}
}
// vim:ft=as3
