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

package {

import aszos2d.Root;

import com.sociodox.theminer.TheMiner;

import flash.display.Sprite;

[SWF(backgroundColor="#000000", frameRate="80", heightPercent="100", widthPercent="100%")]
/**
 * 示例主程序。
 *
 * @author keyhom
 */
public final class Main extends Sprite {

    /**
     * @private
     */
    public function Main() {
        super();
        var root:Root = new Root;
        var miner:TheMiner = new TheMiner;

        addChild(root);
        addChild(miner);
    }

}
}
// vim:ft=as3
