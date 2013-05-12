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

/**
 * This interface defines the View, and should maybe be called the ViewUpdater. It owns the rendering phase, and
 * controls all interactions with the renderer.
 *
 * @author keyhom 
 */
public interface ICanvas {

    /**
     * Do work to initialize this canvas, generally setting up the associated CanvasRenderer, etc.
     */
    [MainThread] function init():void;

    /**
     * Ask the canvas to render itself. Note this may occur in anytime and therefore a latch is given so the caller may
     * know when the draw has completed.
     *
     * @param latch A counter that should be decremented once drawing has completed.
     */
    [MainThread] function draw(latch:* = null):void;

    /**
     * The CanvasRenderer associated with this Canvas.
     */
    function get CanvasRenderer():ICanvasRenderer;
}
}
// vim:ft=as3
