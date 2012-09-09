//example:
package com.baseProject.events 
{
  import flash.events.Event;
  import flash.geom.Rectangle;
  
  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class FullscreenEvent extends Event
  {
    public static const FULLSCREEN:String = "fullscreen";
    public static const SITE:String = "site";
    public static const VIDEO:String = "video";
    
    public var fullscreenType:String;
    public var rectangle:Rectangle;
    
    public function FullscreenEvent(fullscreenType:String = SITE, rectangle:Rectangle = null, type:String = FULLSCREEN, bubbles:Boolean = true, cancelable:Boolean = false)
    {
      super(type, bubbles, cancelable);
      
      this.fullscreenType = fullscreenType;
      this.rectangle = rectangle;
    }
  }
}