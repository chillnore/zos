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

import aszos.asset.IAssetInfo;
import aszos.asset.IAssetLocator;
import aszos.asset.IAssetManager;

import flash.system.ApplicationDomain;
import flash.utils.Dictionary;

/**
 * @author keyhom
 */
public class DefaultAssetManager implements IAssetManager {

    /**
     * Creates a BulkAssetManager instance.
     */
    public function DefaultAssetManager() {
    }

    /** @private */
    private var _paths:Dictionary = new Dictionary();

    /** @private */
    private var _domains:Vector.<ApplicationDomain>;

    /** @inheritDoc */
    public function get domains():Vector.<ApplicationDomain> {
        if (!_domains) {
            _domains = new Vector.<ApplicationDomain>;
        }
        return _domains;
    }

    /** @inheritDoc */
    public function addDomain(domain:ApplicationDomain):void {
        if (null != domain)
            domains.push(domain);
    }

    /** @inheritDoc */
    public function removeDomain(domain:ApplicationDomain):void {
        if (null != domain) {
            var i:int = domains.indexOf(domain);
            if (i >= 0) {
                delete domains[i];
            }
        }
    }

    /** @inheritDoc */
    public function registerLocator(rootPath:String, locatorClass:Class):void {
        if (null != rootPath && rootPath.length > 0) {
            if (locatorClass is IAssetLocator)
                throw new ArgumentError("Invalid locator class.");
            try {
                _paths[rootPath] = new locatorClass;
            } catch (e:Error) {
                throw new ArgumentError("Please make sure the class \"" + locatorClass + "\" has a default constructor.");
            }
        }
    }

    /** @inheritDoc */
    public function unregisterLocator(rootPath:String, locatorClass:Class):void {
        if (null != rootPath && rootPath.length > 0) {
            if (rootPath in _paths)
                delete _paths[rootPath];
        }
    }

    /** @inheritDoc */
    public function locateAsset(key:Object):IAssetInfo {
        return null;
    }

    /** @inheritDoc */
    public function loadAsset(key:Object):* {
        return null;
    }

}
}
// vim:ft=as3
