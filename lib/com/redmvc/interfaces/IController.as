package com.redmvc.interfaces
{
  import com.redmvc.events.CommandEvent;

  import flash.events.IEventDispatcher;
  
  /**
   * RedMVC
   * Version 1.0.0
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public interface IController extends IEventDispatcher
  {
    function executeCommand(event:CommandEvent):void
  }
}