////////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2013 keyhom.c@gmail.com.
//
// This software is provided 'as-is', without any express or implied warranty.
// In no event will the authors be held liable for any damages arising from
// the use of this software.
//
// Permission is granted to anyone to use this software for any purpose
// excluding commercial applications, and to alter it and redistribute it
// freely, subject to the following restrictions:
//
//     1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//
//     2. Altered source versions must be plainly marked as such, and must not
//     be misrepresented as being the original software.
//
//     3. This notice may not be removed or altered from any source
//     distribution.
//
////////////////////////////////////////////////////////////////////////////////

package aszos.framework {

/**
 * IFrameHandler interface represents a handler for handling the specified frame
 * clip.
 *
 * @author keyhom
 */
public interface IFrameHandler {
    
    //--------------------------------------------------------------------------
    //
    // Methods
    //
    //--------------------------------------------------------------------------

    /**
     * Scheduling to update the frame.
     *
     * @return true or false
     */
    function updateFrame():Boolean;
    
    /**
     * Adds a <tt>IUpdater</tt> to the frame handler.
     * 
     * @param updater The specified <tt>IUpdater</tt>
     * @return This <tt>IFrameHandler</tt> for chaining.
     */
    function addUpdater(updater:IUpdater):IFrameHandler;
    
    /**
     * Removes the specified <tt>IUpdater</tt> instance from the frame handler.
     * 
     * @param updater The specified <tt>IUpdater</tt> to remove.
     * @return This <tt>IFrameHandler</tt> for chaining.
     */
    function removeUpdater(updater:IUpdater):IFrameHandler;
    
    /**
     * Removes all the <tt>IUpdater</tt> added to the frame handler.
     *
     * @return This <tt>IFrameHandler</tt> for chaining.
     */
    function removeAllUpdater():IFrameHandler;
    
    /**
     * Adds a <tt>ICanvas</tt> to the frame handler.
     * 
     * @param canvas The specifeid <tt>ICanvas</tt> to add.
     * @return This <tt>IFrameHandler</tt> for chaining.
     */
    function addCanvas(canvas:ICanvas):IFrameHandler;
    
    /**
     * Removes the specified <tt>ICanvas</tt> instance from the frame handler.
     * 
     * @param canvas The specified <tt>ICanvas</tt> to remove.
     * @return This <tt>IFrameHandler</tt> for chaining.
     */
    function removeCanvas(canvas:ICanvas):IFrameHandler;
    
    /**
     * Removes all the <tt>ICanvas</tt> added to the frame handler.
     * 
     * @return This <tt>IFrameHandler</tt> for chaining.
     */
    function removeAllCanvas():IFrameHandler;

}
}
