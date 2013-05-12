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

package aszos2d.utils {

import aszos.display.ZSprite;
import aszos.framework.IUpdater;
import aszos.utils.IReadOnlyTimer;

import flash.text.TextField;
import flash.text.TextFormat;

/**
 * @author keyhom
 */
public class ASZosMiner extends ZSprite implements IUpdater {

    /**
     * Creates an ASZosMiner instance.
     */
    public function ASZosMiner() {
    }

    public var color:Number = 0x000000;
    public var fontFamily:String = "Arial";
    public var fontSize:int = 12;
    public var fontWeight:String = "normal";
    public var fontStyle:String = "normal";
    /** @private */
    private var _lblTpf:String = "TPF(ms): ";
    /** @private */
    private var _txtTpf:TextField;
    /** @private */
    private var _invalidateProperties:Boolean = false;

    /** @inheritDoc */
    override public function init():void {
        super.init();

        if (!_txtTpf) {
            _txtTpf = new TextField();
        }

        addChild(_txtTpf);
    }

    /** @inheritDoc */
    override public function destory():void {
        super.destory();

        removeChild(_txtTpf);
    }

    /** @inheritDoc */
    public function update(timer:IReadOnlyTimer):void {
        if (_invalidateProperties) {
            _txtTpf.selectable = false;
            var format:TextFormat = new TextFormat(fontFamily, fontSize, color, fontWeight == 'normal' ? null : true, fontStyle == 'normal' ? null : true);
            _txtTpf.multiline = false;
            _txtTpf.defaultTextFormat = format;

            _invalidateProperties = false;
        }
        _txtTpf.text = _lblTpf + int(timer.timePerFrame * 1000);
    }

    /**
     * 失效该<tt>ASZosMiner</tt>，将会重新计算属性，并在下一Update流程中生效。
     */
    public function invalidate():void {
        if (!_invalidateProperties)
            _invalidateProperties = true;
    }
}
}
// vim:ft=as3
