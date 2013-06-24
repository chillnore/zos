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

/**
 * An interface for asset loaders. An <code>IAssetLoader</code> is responsible for
 * loading a certain type of asset associated with file extension(s). The loader
 * will load the data in the provided <tt>IAssetInfo</tt> object by call
 * <code>openStream()</code>, returning an object representing the parsed data.
 *
 * @author keyhom
 */
public interface IAssetLoader {

    /**
     * Loads asset from the given input stream, parsing it into an usable-object.
     *
     * @param info An object representing the information for loading.
     * @return An object representing the resource.
     * @throws flash.events.IOError
     */
    function load(info:IAssetInfo):Object;

}
}
// vim:ft=as3
