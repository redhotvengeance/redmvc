package com.redmvc.events
{
  import com.redmvc.interfaces.ICommand;
  
  import flash.events.Event;
  
  /**
   * RedMVC
   * Version 1.0.0
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class CommandEvent extends Event
  {
    public static const COMMAND:String = "command";
    
    public var Command:Class;
    public var parameters:Object;
    
    public function CommandEvent(Command:Class, parameters:Object=null, type:String=COMMAND, bubbles:Boolean=false, cancelable:Boolean=false)
    {
      super(type, bubbles, cancelable);
      
      this.Command = Command;
      this.parameters = parameters;
    }
  }
}