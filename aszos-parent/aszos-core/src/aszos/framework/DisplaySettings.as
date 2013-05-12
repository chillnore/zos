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
 * Represents a settings of display.
 *
 * @author keyhom 
 */
public class DisplaySettings {

    /**
     * Creates a DisplaySettings instance.
     */
    public function DisplaySettings(width:Number = 0, height:Number = 0, frequency:Number = 0, fullScreen:Boolean = false) {
        this._width = width;
        this._height = height;
        this._frequency = frequency;
        this._fullScreen = fullScreen;
    }

    private var _width:Number;

    /**
     * Width of display.
     */
    public function get width():Number {
        return this._width;
    }

    /**
     * @private
     */
    aszos_internal function set width(value:Number):void {
        this._width = width;
    }

    private var _height:Number;

    /**
     * Height of display.
     */
    public function get height():Number {
        return this._height;
    }

    /**
     * @private
     */
    aszos_internal function set height(value:Number):void {
        this._height = value;
    }

    private var _frequency:Number;

    /**
     * Frequency of display. 60 MHz by default.
     */
    public function get frequency():Number {
        return this._frequency;
    }

    /**
     * @private
     */
    aszos_internal function set frequency(value:Number):void {
        this._frequency = value;
    }

    private var _fullScreen:Boolean;

    /**
     * Tells whether full-screen is.
     */
    public function get fullScreen():Boolean {
        return this._fullScreen;
    }

    /**
     * @private
     */
    aszos_internal function set fullScreen(value:Boolean):void {
        this._fullScreen = value;
    }
}
}

internal namespace aszos_internal="http://p.keyhom.org/zos/aszos";
// vim:ft=as3
