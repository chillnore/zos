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

package aszos2d.loader {

import aszos.display.ZSprite;

import br.com.stimuli.loading.BulkLoader;

/** 内容加载的过程时间，提供加载的当前大小、加载的有效数据及总体信息。 */
[Event(name="progress", type="flash.events.ProgressEvent")]
/** 当且仅当内容加载完成时触发。 */
[Event(name="complete", type="flash.events.Event")]
/**
 * <tt>PreLoader</tt>被设计于用于预加载阶段，控制游戏启动时所需的资源加载。
 * 例如，游戏静态数据、显示的图片资源、游戏UI元素、各种显示模型等。
 * <tt>PreLoader</tt>使用第三方库<tt>BulkLoader</tt>依赖实现，具备队列加载及并发
 * 加载等多种支持。
 *
 * @author keyhom
 */
public class PreLoader extends ZSprite {

    /**
     * Creates a PreLoader instance.
     */
    public function PreLoader() {
        super();
    }

    /** @private */
    private var _nativeLoader:BulkLoader;

    /**
     * PreLoader的实现加载器<tt>BulkLoader</tt>。
     */
    public function get nativeLoader():BulkLoader {
        return _nativeLoader;
    }

    /** @inheritDoc */
    override public function init():void {
        super.init();

        if (!_nativeLoader) {
            _nativeLoader = new BulkLoader();
        }
    }

    /** @inheritDoc */
    override public function destory():void {
        super.destory();

        if (_nativeLoader) {
            _nativeLoader.clear();
            _nativeLoader = null;
        }
    }

}
}
// vim:ft=as3
