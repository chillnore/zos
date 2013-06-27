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

package aszos.framework {

CONFIG::debug {
    import _69.logging.ILogger;
    import _69.logging.LoggerFactory;
};

import flash.utils.getTimer;

import aszos.utils.AlternateTimer;

/**
 * Does the work needed in a specific frame.
 *
 * @author keyhom
 */
public final class FrameHandler implements IFrameHandler {
    
    //--------------------------------------------------------------------------
    //
    // Logger
    //
    //--------------------------------------------------------------------------
    
    CONFIG::debug {
        /** @private */
        private static const LOG:ILogger = LoggerFactory.getLogger(FrameHandler);
    };
    
    //--------------------------------------------------------------------------
    //
    // Constructor
    //
    //--------------------------------------------------------------------------
    
    /**
     * Creates a FrameHandler instance.
     */
    public function FrameHandler(timer:AlternateTimer = null) {
        if (null == timer) {
            timer = new AlternateTimer();
        }
        
        this.timer = timer;
    }
    
    //--------------------------------------------------------------------------
    //
    // Constants
    //
    //--------------------------------------------------------------------------
    
    /** @private */
    private const updaters:Vector.<IUpdater> = new Vector.<IUpdater>();
    /** @private */
    private const canvases:Vector.<ICanvas> = new Vector.<ICanvas>();
    
    //--------------------------------------------------------------------------
    //
    // Variables
    //
    //--------------------------------------------------------------------------
    
    /** @private */
    private var timer:AlternateTimer;
    /** @private */
    private var lastTickPosition:int;
    
    //--------------------------------------------------------------------------
    //
    // Properties
    //
    //--------------------------------------------------------------------------
    
    //----------------------------------
    // updateThreshold
    //----------------------------------
    
    /** @private */
    private var _updateThreshold:Number = 0;
    
    /** @inheritDoc */
    public function get updateThreshold():Number {
        return _updateThreshold > 0 ? _updateThreshold : 1;
    }
    
    /** @private */
    public function set updateThreshold(value:Number):void {
        _updateThreshold = value;
    }
    
    //--------------------------------------------------------------------------
    //
    // Methods
    //
    //--------------------------------------------------------------------------
    
    /** @inheritDoc */
    public function updateFrame():Boolean {
        
        // calculate tpf
        // update updaters
        // draw canvases

        var tickPosition:int = getTimer() % 1000 / updateThreshold;
        if (lastTickPosition != tickPosition) {
            lastTickPosition = tickPosition;
            timer.update();
            
            var i:int = 0;
            var len:int = 0;
            
            // notified all updaters.
            for (i = 0, len = updaters.length; i < len; i++) {
                if (null != updaters[i]) {
                    updaters[i].update(timer);
                }
            }
            
            // TODO: synchronization after FP 11.4 ??? the multi-thread mode ???.
            try {
                for (i = 0, len = canvases.length; i < len; i++) {
                    if (null != canvases[i])
                        canvases[i].draw();
                }
            } catch (e:Error) {
                CONFIG::debug {
                    LOG.error("UpdateFrames error caught: {0}", e.message, e);
                };
            }
        }
        
        return timer.timePerFrame >= .02;
    }
    
    /** @inheritDoc */
    public function addUpdater(updater:IUpdater):IFrameHandler {
        if (updater) {
            updaters.push(updater);
        }
        return this;
    }
    
    /** @inheritDoc */
    public function removeAllUpdater():IFrameHandler {
        updaters.length = 0;
        return this;
    }
    
    /** @inheritDoc */
    public function removeUpdater(updater:IUpdater):IFrameHandler {
        if (updater) {
            var i:int = updaters.indexOf(updater);
            if (i >= 0) {
                delete updaters[i];
            }
        }
        
        return this;
    }
    
    /** @inheritDoc */
    public function addCanvas(canvas:ICanvas):IFrameHandler {
        if (canvas) {
            canvases.push(canvas);
        }
        return this;
    }
    
    /** @inheritDoc */
    public function removeCanvas(canvas:ICanvas):IFrameHandler {
        if (canvas) {
            var i:int = canvases.indexOf(canvas);
            if (i >= 0) {
                delete canvases[i];
            }
        }
        return this;
    }
    
    /** @inheritDoc */
    public function  removeAllCanvas():IFrameHandler {
        canvases.length = 0;
        return this;
    }
    
}
}
// vim:ft=as3
