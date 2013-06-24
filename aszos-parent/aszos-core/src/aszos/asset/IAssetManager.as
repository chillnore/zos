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

import flash.system.ApplicationDomain;

/**
 * <code>IAssetManager</code> provides an interface for managing the data assets.
 * The asset manager provides a means to register <tt>AssetLocator</tt>s, which
 * are used to find asset data on disk, network, or other file system. The asset
 * locator are invoked in order of addition to find the asset data. Use the
 * <code>registerLocator(String, Class)<code> method to add new <tt>AssetLocator</tt>s.
 *
 * @author keyhom
 */
public interface IAssetManager {

    /**
     * Adds a <tt>flash.system.ApplicationDomain</tt> that is used to load
     * <tt>Class</tt> that are needed for finding and loading assets.
     * This does <strong>not</strong> allow loading assets from that domain,
     * use registerLocator for that.
     *
     * @param domain A application domain that definition in asset files can be
     * loaded from.
     */
    function addDomain(domain:ApplicationDomain):void;

    /**
     * Removes a <tt>flash.system.ApplicationDomain</tt> from the list of registered
     * domains.
     *
     * @param domain A application domain that was registered in the list.
     */
    function removeDomain(domain:ApplicationDomain):void;

    /**
     * The registered <tt>flash.system.ApplicationDomain</tt>s.
     */
    function get domains():Vector.<ApplicationDomain>;

    /**
     * Registers an <tt>AssetLocator</tt> by using a class definition.
     *
     * @param rootPath Specifies the root path from which to locate assets for
     * the given <tt>IAssetLocator</tt>. The purpose of this parameter depends
     * on the type of <tt>IAssetLocator</tt>.
     * @param locatorClass The class type of the <tt>IAssetLocator</tt> to register.
     */
    function registerLocator(rootPath:String, locatorClass:Class):void;

    /**
     * UnRegisters the given locator class.
     *
     * @param rootPath Should be the same as the root path specified in
     * <tt>registerLocator(String, Class)</tt>.
     * @param locatorClass The locator class to unregister.
     */
    function unregisterLocator(rootPath:String, locatorClass:Class):void;

    /**
     * Manually locates an asset with the given <code>key</code>. This method
     * should be used for debugging or internal uses. <br/>
     * <tt>IAssetLocator</tt> that are registered with this <code>IAssetManager</code>,
     * in the same way that the <tt>IAssetManager#locateAsset(key:Object)</tt>
     * method locates assets.
     *
     * @param key The key to locate.
     * @return The <tt>IAssetInfo</tt> object returned from the <tt>IAssetLocator</tt>
     * that located the asset, or null if the asset cannot be located.
     */
    function locateAsset(key:Object):IAssetInfo;

    /**
     * Load an asset from a key, the asset will be located by one of the <tt>IAssetLocator</tt>
     * implementations provided in the <tt>IAssetManager#registerLocator(string, class)</tt> call.
     * If located successfully, it will be loaded via the appropriate <tt>IAssetLocator</tt>
     * implementation based on the file's extension, as specified in the call
     * <tt>IAssetManager#registerLoader(class, Vector.<String>)</tt>.
     *
     * @param key The key of asset.
     * @return The loaded asset, or null if it was failed to be located or loaded.
     */
    function loadAsset(key:Object):*;

}
}
// vim:ft=as3
