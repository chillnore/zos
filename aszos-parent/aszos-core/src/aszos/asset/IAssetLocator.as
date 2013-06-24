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

package aszos.asset {

import _69.core.api.IClone;

/**
 * <tt>IAssetLocator</tt> is used to locate a resource based on an key of asset.
 *
 * @author keyhom
 */
public interface IAssetLocator extends IClone {

    /**
     * Sets the root path which the locator to process.
     *
     * @param rootPath The root path where to look for assets. Typically this
     * method will only be called once per instance of an asset locator.
     */
    function setRootPath(rootPath:String):void;

    /**
     * Request to locate an asset. The asset key contains a name identifying the
     * asset. If an asset was not found, null should be returned. The <tt>IAssetInfo</tt>
     * implementation provided should have a proper return value for its
     * <code>openStream()</code> method.
     *
     * @param manager The manager which associated with this locator.
     * @param key The key for the <tt>IAssetInfo</tt>.
     * @return An <tt>IAssetInfo</tt> that was located, or null if not found.
     */
    function locate(manager:IAssetManager, key:Object):IAssetInfo;

}
}
// vim:ft=as3
