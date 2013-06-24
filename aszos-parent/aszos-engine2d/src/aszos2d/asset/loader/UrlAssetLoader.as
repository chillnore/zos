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

package aszos2d.asset.loader {

import _69.core.api.DefaultFuture;
import _69.core.api.ILifecycle;

import aszos.asset.IAssetInfo;
import aszos.asset.IAssetLoader;

import aszos2d.asset.UrlAssetInfo;

import flash.errors.IOError;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.net.URLLoader;
import flash.utils.getQualifiedClassName;
import flash.utils.getTimer;

/**
 * 通过URL的资源加载器。
 *
 * @author keyhom
 */
public class UrlAssetLoader implements IAssetLoader, ILifecycle {

    /** @private */
    private static var _INSTANCE_ID:int = 0;

    /** @private */
    internal static function get nextInstanceId():int {
        return ++_INSTANCE_ID;
    }

    /**
     * Creates a DefaultAssetLoader instance.
     */
    public function UrlAssetLoader(info:IAssetInfo) {
        this._info = info;
    }

    /** @private */
    private var _completeFuture:DefaultFuture;
    /** @private */
    private var _info:IAssetInfo;
    /** @private */
    private var _idNum:int = nextInstanceId;

    /** @private */
    public function toString():String {
        return getQualifiedClassName(this) + '#' + _idNum + '[' + (_info || 'empty') + ']';
    }

    /** @inheritDoc */
    public function load(info:IAssetInfo):Object {
        use namespace aszos_internal;

        _nativeLoader.addEventListener(ProgressEvent.PROGRESS, _onProgress);
        _nativeLoader.addEventListener(Event.COMPLETE, _onComplete);
        _nativeLoader.addEventListener(IOErrorEvent.IO_ERROR, _onIoError);
        _nativeLoader.addEventListener(Event.OPEN, _onOpen);
        _nativeLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, _onHttpStatus);

        try {
            _nativeLoader.load(UrlAssetInfo(_info).url);
        } catch (e:SecurityError) {
            _completeFuture.complete(e); // complete with a error.
        }

        return _completeFuture;
    }

    /** @inheritDoc */
    public function init():void {
        if (!aszos_internal::_nativeLoader) {
            aszos_internal::_nativeLoader = new URLLoader();
        }

        if (!_completeFuture) {
            _completeFuture = new DefaultFuture();
        }
    }

    /** @inheritDoc */
    public function destory():void {
        if (aszos_internal::_nativeLoader) {
            aszos_internal::_nativeLoader.close();
        }
        aszos_internal::_nativeLoader = null;

        if (_completeFuture) {
            _completeFuture.destory();
        }
        _completeFuture = null;
    }

    /** @private */
    private function _onProgress(evt:ProgressEvent):void {
    }

    /** @private */
    private function _onComplete(evt:Event):void {
        with (UrlAssetInfo(_info)) {
            _totalTime = getTimer();
            _timeToDownload = ((_totalTime - _responseTime) / 1000);
            if (_timeToDownload == 0) {
                _timeToDownload = .1;
            }

            _bytesTotal = _bytesLoaded;
            _speed = int(((_bytesTotal) / 1024) / _timeToDownload);
            _status = STATUS_FINISHED;
            _isLoaded = true;
        }
        evt.stopPropagation();
        _completeFuture.complete(_info);
    }

    /** @private */
    private function _onHttpStatus(evt:HTTPStatusEvent):void {
        with (UrlAssetInfo(_info)) {
            _httpStatus = evt.status;
            _completeFuture.complete(info, evt);
        }
    }

    /** @private */
    private function _onIoError(evt:IOErrorEvent):void {
        with (UrlAssetInfo(_info)) {
            _numTries++;

            if (_numTries < _maxTries) {
                _status = null;
                load(info);
            } else {
                _status = STATUS_ERROR;
                _completeFuture.complete(info, new IOError(evt.text, evt.errorID));
            }
        }

        evt.stopPropagation();
    }

    /** @private */
    private function _onOpen(evt:Event):void {
        with (UrlAssetInfo(_info)) {
            _responseTime = getTimer();
            _latency = int((_responseTime - _startTime) / 1000);
            _status = STATUS_STARTED;
        }
        _completeFuture.complete(_info, evt);
    }

    /** @private */
    aszos_internal var _nativeLoader:URLLoader;
}
}

namespace aszos_internal = "ASZosInternal";
// vim:ft=as3
