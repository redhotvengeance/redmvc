package com.redmvc.interfaces
{
  import com.redmvc.events.CommandEvent;

  import flash.display.Stage;
  import flash.events.Event;
  
  /**
   * RedMVC
   * Version 1.0.0
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public interface IApplication
  {
    function initialize(root:Object):void
    
    function applicationInitialized(event:Event):void
  }
}