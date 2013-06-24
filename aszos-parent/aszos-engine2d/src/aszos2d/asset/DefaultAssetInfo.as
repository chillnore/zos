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

package aszos2d.asset {

import _69.core.api.ILifecycle;

import aszos.asset.IAssetInfo;
import aszos.asset.IAssetManager;

/**
 * @author keyhom
 */
public class DefaultAssetInfo implements IAssetInfo, ILifecycle {

    /**
     * Creates a DefaultAssetInfo instance.
     */
    public function DefaultAssetInfo() {
    }

    /** @private */
    private var _data:Object;

    /** @private */
    private var _key:Object;

    /** @inheritDoc */
    public function get key():Object {
        return _key;
    }

    /** @private */
    private var _manager:IAssetManager;

    /** @inheritDoc */
    public function get manager():IAssetManager {
        return _manager;
    }

    /** @inheritDoc */
    public function openStream():Object {
        return _data;
    }

    /** @inheritDoc */
    public function init():void {
    }

    /** @inheritDoc */
    public function destory():void {
    }

    /** @inheritDoc */
    public function toString():String {
        return "DefaultAssetInfo[]";
    }
}
}
// vim:ft=as3
