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

package aszos2d.core {

import _69.logging.ILogger;
import _69.logging.LoggerFactory;

import aszos.display.ZSprite;

/**
 * @author keyhom
 */
public class Application extends ZSprite {

    CONFIG::debug {
        /** @private */
        private static const LOG:ILogger = LoggerFactory.getLogger(Application);
    }

    /**
     * Creates an Application instance.
     */
    public function Application() {
        CONFIG::debug {
            LOG.debug("Constructs an Application.");
        }
    }

    /** @inheritDoc */
    override public function init():void {
        super.init();

        CONFIG::debug {
            LOG.debug("Initializing Application.");
        }
    }

    /** @inheritDoc */
    override public function destory():void {
        super.destory();

        CONFIG::debug {
            LOG.debug("Destoryed Application.");
        }
    }

}
}
// vim:ft=as3
