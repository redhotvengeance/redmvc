package com.redmvc.interfaces
{
  import flash.display.Stage;
  import flash.events.IEventDispatcher;
  
  /**
   * RedMVC
   * Version 1.0.0
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public interface IView extends IEventDispatcher
  {
    function initialize():void
  }
}