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

    /** @private */
    private function _addController(e:Event):void {
        init();
    }

    /** @private */
    private function _removeController(e:Event):void {
        destory();
    }

    /** @inheritDoc */
    public function init():void {
    }

    /** @inheritDoc */
    public function destory():void {
    }

}
}
// vim:ft=as3
