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

package aszos2d {

import _69.core.api.IHandler;
import _69.core.api.ILifecycle;
import _69.logging.ILogger;
import _69.logging.LoggerFactory;

import aszos.framework.FrameHandler;

import aszos2d.display.IStageHandler;
import aszos2d.utils.ASZosMiner;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.errors.IllegalOperationError;
import flash.events.Event;
import flash.system.Capabilities;

/**
 * 根基容器，所有的显示元素必须加入到Root中除了Stage。
 *
 * @author keyhom
 */
public final class Root extends Sprite implements IHandler, ILifecycle {

    CONFIG::debug {
        /** @private */
        private static const LOG:ILogger = LoggerFactory.getLogger(Root);
    }

    CONFIG::debug {
        /** @private */
        private var _miner:ASZosMiner = new ASZosMiner;
    }
    /** @private */
    private const _stageHandlers:Vector.<IStageHandler> = new
            Vector.<IStageHandler>;

    /**
     * Creates a Root instance.
     */
    public function Root() {
        super();

        CONFIG::debug {
            LOG.info("Root初始化。");
        }

        this.init();
    }

    /** @private */
    private var _init:Boolean = false;
    /** @private */
    private var _renderCurrentFrame:Boolean = false;

    /** @private */
    private var _frameHandler:FrameHandler;

    /**
     * 在Root容器上的帧控制器<tt>FrameHandler</tt>。
     */
    public function get frameHandler():FrameHandler {
        return _frameHandler;
    }

    /**
     * @inheritDoc
     */
    public function init():void {
        if (!_init) {
            initialize();
            _init = true;
        }
    }

    /**
     * @inheritDoc
     */
    public function run(...rest):void {
        // Nothing to do.
    }

    /**
     * @inheritDoc
     */
    public function destory():void {
        if (_init) {
            if (stage) {
                if (stage.hasEventListener(Event.ENTER_FRAME))
                    stage.removeEventListener(Event.ENTER_FRAME, _onStageEnterFrame);
                if (stage.hasEventListener(Event.RENDER))
                    stage.removeEventListener(Event.RENDER, _onStageRender);
                if (stage.hasEventListener(Event.RESIZE))
                    stage.removeEventListener(Event.RESIZE, _onStageResize);
            }

            if (_frameHandler is ILifecycle) {
                ILifecycle(_frameHandler).destory();
            }

            _frameHandler = null;
            _stageHandlers.splice(0, _stageHandlers.length); // Removes all.
        }
    }

    /**
     * 注册实现于IStageHandler的Stage控制器，
     */
    public function registerStageHandler(h:IStageHandler):void {
        if (null == h)
            throw new ArgumentError("Invalid IStageHandler.");
        _stageHandlers.push(h);
    }

    /**
     * Make initialization.
     */
    protected function initialize():void {
        if (!_frameHandler) {
            _frameHandler = new FrameHandler();
        }

        CONFIG::debug {
            LOG.info("Flash player version: {0}", Capabilities.version.split(" "));
        }

        // Initialize the stage.
        if (stage) {
            initStage();
        } else {
            var stageComplete:Function;
            addEventListener(Event.ADDED_TO_STAGE, stageComplete =
                    function (e:Event):void {
                        removeEventListener(Event.ADDED_TO_STAGE,
                                stageComplete);
                        initStage();
                        stageComplete = null;
                    });
        }
    }

    /**
     * 初始化Stage。
     */
    protected function initStage():void {
        CONFIG::debug {
            LOG.info("初始化Stage。");
        }

        if (!stage)
            throw new IllegalOperationError("无效的stage对象.");

        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

        stage.addEventListener(Event.RESIZE, _onStageResize);
        stage.addEventListener(Event.ENTER_FRAME, _onStageEnterFrame);
        stage.addEventListener(Event.RENDER, _onStageRender);

        CONFIG::debug {
            addChild(_miner);
            _frameHandler.addUpdater(_miner);

            _miner.x = 10;
            _miner.y = 20;
            _miner.color = 0xFFFFFF;
            _miner.invalidate();
        }
    }

    /** @private */
    private function _onStageEnterFrame(e:Event):void {
        _renderCurrentFrame = _frameHandler.updateFrame();
    }

    /** @private */
    private function _onStageRender(e:Event):void {
        if (!_renderCurrentFrame) {
            e.stopImmediatePropagation();
        }
    }

    /** @private */
    private function _onStageResize(event:Event):void {
        for each (var h:IStageHandler in _stageHandlers) {
            h.onResize(event, stage.stageWidth, stage.stageHeight);
        }
    }

}
}
// vim:ft=as3
