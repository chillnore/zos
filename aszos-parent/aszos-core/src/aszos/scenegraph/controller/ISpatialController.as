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

package aszos.scenegraph.controller {

import aszos.scenegraph.Spatial;

/**
 * 被设计用于控制Spatial对象，例如Spatial对象的移动，效果等各种各样的实现。
 *
 * @author keyhom
 */
public interface ISpatialController {

    /**
     * 更新数据。
     *
     * @param time 上一次调用至当初调用所用的时间刻度。
     * @param caller 调用该控制器的Spatial对象。
     */
    function update(time:Number, caller:Spatial):void;

}
}
// vim:ft=as3
