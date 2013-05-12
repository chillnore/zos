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

package aszos.framework {

import _69.logging.ILogger;
import _69.logging.LoggerFactory;

import aszos.utils.AlternateTimer;

import flash.utils.Timer;

/**
 * Does the work needed in a specific frame.
 *
 * @author keyhom
 */
public final class FrameHandler {

    CONFIG::debug {
        /** @private */
        private static const LOG:ILogger = LoggerFactory.getLogger(FrameHandler);
    }
    /** @private */
    private const _updaters:Vector.<IUpdater> = new Vector.<IUpdater>();
    /** @private */
    private const _canvases:Vector.<ICanvas> = new Vector.<ICanvas>();
    /** @private */
    private const _timeoutSeconds:int = 5;
    /** @private */
    private const _latchMonitor:Timer = new Timer(_timeoutSeconds);

    /**
     * Creates a FrameHandler instance.
     */
    public function FrameHandler(timer:AlternateTimer = null) {
        if (!timer) {
            timer = new AlternateTimer();
        }
        this._timer = timer;
    }

    /** @private */
    private var _timer:AlternateTimer;

    /**
     * Do updating the frames.
     */
    public function updateFrame():Boolean {

        // monitor state detect and reset.
        if (_latchMonitor.running)
            _latchMonitor.stop();

        // calculate tpf
        // update updaters
        // draw canvases

        _timer.update();

        // notified all updaters.
        for each(var updater:IUpdater in _updaters) {
            if (updater)
                updater.update(_timer);
        }

        // TODO: synchronization after FP 11.4 ??? the multi-thread mode ???.
        const numCanvases:int = _canvases.length;

        try {
            for each(var canvas:ICanvas in _canvases) {
                if (canvas)
                    canvas.draw();
            }
        } catch (e:Error) {
            LOG.error("UpdateFrames error caught: {0}", e.message, e);
        }

//        CONFIG::debug {
//            LOG.debug("TPF: {0}", _timer.timePerFrame);
//        }
        return _timer.timePerFrame >= .02;
    }

    /**
     * 添加<tt>IUpdate</tt>实例。
     *
     * @return This <tt>FrameHandler</tt> for chaining.
     */
    public function addUpdater(updater:IUpdater):FrameHandler {
        if (updater) {
            _updaters.push(updater);
        }
        return this;
    }

    /**
     * 移除指定的<tt>IUpdater</tt>。
     *
     * @return This <tt>FrameHandler</tt> for chaining.
     */
    public function removeUpdater(updater:IUpdater):FrameHandler {
        if (updater) {
            var i:int = _updaters.indexOf(updater);
            if (i >= 0) {
                delete _updaters[i];
            }
        }

        return this;
    }

    /**
     * 添加<tt>ICanvas</tt>实例。
     *
     * @return This <tt>FrameHandler</tt> for chaining.
     */
    public function addCanvas(canvas:ICanvas):FrameHandler {
        if (canvas) {
            _canvases.push(canvas);
        }
        return this;
    }

    /**
     * 移除指定的<tt>ICanvas</tt>。
     *
     * @return This <tt>FrameHandler</tt> for chaining.
     */
    public function removeCanvas(canvas:ICanvas):FrameHandler {
        if (canvas) {
            var i:int = _canvases.indexOf(canvas);
            if (i >= 0) {
                delete _canvases[i];
            }
        }
        return this;
    }
}
}
// vim:ft=as3
