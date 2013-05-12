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

import aszos.renderer.Renderer;

/**
 * Owns all the data that is related to the scene. This class should not really know anything about rendering or the
 * screen, it's just the scene data.
 *
 * @author keyhom 
 */
public interface IScene {

    /**
     * Renders.
     *
     * @param r The renderer.
     * @return True if a render occurred and we should swap the buffers.
     */
    [MainThread] function renderUnto(r:Renderer):Boolean;

    /**
     * A scene should be able to handle a pick execution as it is the only thing that has a complete picture of the
     * scenegraph(s).
     *
     * @param pickRay The pick ray.
     * @return The result of picking.
     */
    // [MainThread] function doPick(pickRay:IPickRay):IPickResults;
}
}
// vim:ft=as3
