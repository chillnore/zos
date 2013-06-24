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

package aszos.scenegraph {

import aszos.scenegraph.controller.ISpatialController;

/**
 * <tt>Spatial</tt> 被设计于基类，用在<tt>scenegraph</tt>所相关的对象。
 *
 * @author keyhom
 */
public class Spatial {

    /**
     * Creates a Spatial instance.
     */
    public function Spatial(name:String) {
        setName(name);
    }

    /** @private */
    private var _controllers:Vector.<ISpatialController>;

    /** @private */
    private var _name:String;

    /**
     * Name of this Spatial.
     */
    public function get name():String {
        return _name;
    }

    /** @private */
    private var _parent:Node;

    /**
     * The parent of this Spatial.
     */
    public function get parent():Node {
        return _parent;
    }

    /** @private */
    private var _userData:Object;

    /**
     * 用户数据，既是该Spatial所关联的被设置的数据，该对象为动态类型。
     */
    public function get userData():Object {
        return _userData;
    }

    /**
     * 添加Spatial的控制器。
     *
     * @param controller 待添加的控制器
     */
    public function addController(controller:ISpatialController):void {
        if (controller) {
            _controllers.push(controller);
        }
    }

    /**
     * 移除Spatial的指定控制器。
     *
     * @param controller 待移除的控制器
     * @return <tt>true</tt>如果移除成功，否则返回<tt>false</tt>
     */
    public function removeController(controller:ISpatialController):Boolean {
        if (controller) {
            var i:int = _controllers.indexOf(controller);
            if (i >= 0) {
                delete _controllers[i];
                return true;
            }
        }
        return false;
    }

    /** @private */
    protected function setUserData(value:Object):void {
        this._userData = value;
    }

    /** @private */
    protected function setName(value:String):void {
        this._name = value;
    }

    /** @private */
    protected function setParent(value:Node):void {
        this._parent = value;
    }
}
}
// vim:ft=as3
