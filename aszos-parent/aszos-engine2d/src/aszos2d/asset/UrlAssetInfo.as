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

package aszos2d.asset {

import _69.core.api.DefaultFuture;

import flash.net.URLLoader;
import flash.net.URLRequest;

/**
 * <tt>UrlAssetInfo</tt> 被设计于描述通过URL加载的资源信息。
 *
 * @author keyhom
 */
public class UrlAssetInfo extends DefaultAssetInfo {

    use namespace aszos_internal;

    /** @private */
    public static const STATUS_STOPPED:String = "stopped";
    /** @private */
    public static const STATUS_STARTED:String = "started";
    /** @private */
    public static const STATUS_FINISHED:String = "finished";
    /** @private */
    public static const STATUS_ERROR:String = "error";
    /** @private */
    public static const STATUS_LOADING:String = "loading";

    /**
     * 以友好的单位输出大小。
     */
    public static function toHumanSize(value:Number):String {
        if (isNaN(value))
            return '0';

        var kb:Number = value / 1024;
        if (kb < 1024)
            return Math.ceil(kb) + ' KB';
        else
            return (kb / 1024).toPrecision(3) + " MB";
    }

    /**
     * Creates a UrlAssetInfo instance.
     */
    public function UrlAssetInfo(url:URLRequest) {
        if (null == url)
            throw new ArgumentError("无效的URLRequest。");
        this._url = url;
    }

    /** @private */
    aszos_internal var _url:URLRequest;

    /**
     * URLRequest.
     */
    public function get url():URLRequest {
        return _url;
    }

    /** @private */
    aszos_internal var _preventCache:Boolean;

    /**
     * 是否阻止HTTP缓存机制。
     */
    public function get preventCache():Boolean {
        return _preventCache;
    }

    /** @private */
    aszos_internal var _weight:int = 1;

    /**
     * 权重值。
     */
    public function get weight():int {
        return _weight;
    }

    /** @private */
    aszos_internal var _numTries:int = 3;

    /**
     * 设置的重试次数。
     */
    public function get numTries():int {
        return _numTries;
    }

    /** @private */
    aszos_internal var _maxTries:int = 3;

    /**
     * 最大的重试次数。
     */
    public function get maxTries():int {
        return _maxTries;
    }

    /** @private */
    aszos_internal var _status:String;

    /**
     * 当前的状态。
     */
    public function get status():String {
        return _status;
    }

    /** @private */
    aszos_internal var _type:String;

    /**
     * 加载的资源类型。
     */
    public function get type():String {
        return _type;
    }

    /**
     * 是否正在加载。
     */
    public function get loading():Boolean {
        return _status == STATUS_LOADING;
    }

    /** @private */
    aszos_internal var _content:*;

    /**
     * 下载的内容。
     */
    public function get content():* {
        return _content;
    }

    /**
     * 是否使用内部加载器，例如，SWF、图片。
     */
    public function get loaderInternal():Boolean {
        return false;
    }

    /**
     * 是否为流数据，既可以一边加载一边使用，例如流媒体。
     */
    public function get stream():Boolean {
        return false;
    }

    /** @private */
    aszos_internal var _bytesTotal:int;

    /**
     * 总共的二进制数据大小。
     */
    public function get bytesTotal():int {
        return _bytesTotal;
    }

    /** @private */
    aszos_internal var _bytesLoaded:int;

    /**
     * 加载完成的二进制数据。
     */
    public function get bytesLoaded():int {
        return _bytesLoaded;
    }

    /** @private */
    aszos_internal var _percentLoaded:Number;

    /**
     * 下载完成比例。
     */
    public function get percentLoaded():Number {
        return _percentLoaded;
    }

    /** @private */
    aszos_internal var _weightPercentLoaded:Number;

    /** @private */
    public function get weightPercentLoaded():Number {
        return _weightPercentLoaded;
    }

    /** @private */
    aszos_internal var _priority:int;

    /**
     * 优先级，数值越高，优先级越高。
     */
    public function get priority():int {
        return _priority;
    }

    /** @private */
    aszos_internal var _loaded:Boolean;

    /**
     * 检测是否加载完成。
     */
    public function get loaded():Boolean {
        return _loaded;
    }

    /** @private */
    aszos_internal var _addedTime:int;

    /**
     * 被添加时间。
     */
    public function get addedTime():int {
        return _addedTime;
    }

    /** @private */
    aszos_internal var _startTime:int;

    /**
     * 开始时间
     */
    public function get startTime():int {
        return _startTime;
    }

    /** @private */
    aszos_internal var _responseTime:Number;

    /**
     * 远程响应时间。
     */
    public function get responseTime():Number {
        return _responseTime;
    }

    /** @private */
    aszos_internal var _speed:Number;

    /**
     * 加载速度。
     */
    public function get speed():Number {
        return _speed;
    }

    /** @private */
    aszos_internal var _httpStatus:int = -1;

    /**
     * 当前的HTTP协议状态。
     */
    public function get httpStatus():int {
        return _httpStatus;
    }

    /** @private */
    aszos_internal var _hostName:String;

    /**
     * 远程资源服务器主机地址。
     */
    public function get hostName():String {
        return _hostName;
    }

    /** @private */
    aszos_internal var _latency:Number;

    /**
     * 网络延时，单位：秒。
     */
    public function get latency():Number {
        return _latency;
    }

    /** @private */
    aszos_internal var _totalTime:int;

    /**
     * 总共所需时间。
     */
    public function get totalTime():int {
        return _totalTime;
    }

    /** @private */
    aszos_internal var _timeToDownload:int;

    /**
     * 下载完成所需的时间，单位：秒。
     */
    public function get timeToDownload():int {
        return _timeToDownload;
    }

    /** @inheritDoc */
    override public function openStream():Object {
        return aszos_internal::_completeFuture;
    }

    /** @inheritDoc */
    override public function init():void {
        super.init();

        if (!aszos_internal::_loader) {
            aszos_internal::_loader = new URLLoader();
        }
    }

    /** @inheritDoc */
    override public function destory():void {
        super.destory();

        if (aszos_internal::_loader) {
//            aszos_internal::_loader.removeEventListener();
            aszos_internal::_loader.close();
        }

        aszos_internal::_loader = null;
    }

    /**
     * 输出状态信息。
     *
     * @return 状态信息
     */
    public function toStatusString():String {
        return null;
    }

    /** @private */
    aszos_internal var _completeFuture:DefaultFuture;
    /** @private */
    aszos_internal var _loader:URLLoader;

}
}

namespace aszos_internal = "ASZosInternal";
// vim:ft=as3
