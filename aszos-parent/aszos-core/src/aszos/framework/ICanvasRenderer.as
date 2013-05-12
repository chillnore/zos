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
 * Represents a class that knows how to render a scene using a specific Graphic-API implementation.
 *
 * @author keyhom 
 */
public interface ICanvasRenderer {

    /**
     * The camera being used by this canvas renderer. Modifying the return <code>Camera</code> instance effects the view
     * being rendered, so this method can be used to move the camera, etc.
     */
    function get camera():*;

    /**
     * @private
     */
    function set camera(camera:*):void;

    /**
     * The scene being used by this canvas renderer.
     */
    function get scene():IScene;

    /**
     * @private
     */
    function set scene(scene:IScene):void;

    /**
     * The renderer being used by this canvas renderer.
     */
    function get renderer():Renderer;

    /**
     * The specific IRenderContext associated with this ICanvasRenderer.
     */
    function get renderContext():Object;

    /**
     * Do the initialization work for this renderer.
     *
     * @param settings The settings of display.
     * @param doSwap True if swap the scene buffers, false otherwise.
     */
    function init(settings:DisplaySettings, doSwap:Boolean = true):void;

    /**
     * Draws the current state of the scene.
     * @return
     */
    [MainThread] function draw():Boolean;

    /**
     * Haves the ICanvasRenderer claim the graphics context.
     */
    function makeCurrentContext():void;

    /**
     * Haves the ICanvasRenderer release the graphics context.
     */
    function releaseCurrentContext():void;

}
}
// vim:ft=as3
