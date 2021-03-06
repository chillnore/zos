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

package aszos.display {

import _69.core.api.ILifecycle;

import flash.display.Sprite;
import flash.events.Event;

/**
 * 基于Sprite类，适用于<tt>ASZos</tt>的设计理念的兼容实现。
 *
 * @author keyhom
 */
public class ZSprite extends Sprite implements ILifecycle {

    /**
     * Creates a ZSprite instance.
     */
    public function ZSprite() {
        super();

        addEventListener(Event.ADDED, _addController, false, 0, true);
        addEventListener(Event.REMOVED, _removeController, false, 0, true);
    }

    /** @inheritDoc */
    public function init():void {
    }

    /** @inheritDoc */
    public function destory():void {
    }

    /** @private */
    private function _addController(e:Event):void {
        if (!aszos_internal::_initialized) {
            aszos_internal::_initialized = true;
            init();
        }
    }

    /** @private */
    private function _removeController(e:Event):void {
        if (aszos_internal::_initialized)
            destory();
    }

    /** @private */
    aszos_internal var _initialized:Boolean = false;

}
}

namespace aszos_internal = "ASZosInternal";
// vim:ft=as3
