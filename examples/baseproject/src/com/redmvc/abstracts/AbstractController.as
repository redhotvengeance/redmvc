package com.redmvc.abstracts
{
  import com.redmvc.events.CommandEvent;
  import com.redmvc.interfaces.ICommand;
  import com.redmvc.interfaces.IController;

  import flash.events.EventDispatcher;
  
  /**
   * RedMVC
   * Version 1.0.0
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class AbstractController extends EventDispatcher implements IController
  {
    public static const NAME:String = "AbstractController";
    
    public function executeCommand(event:CommandEvent):void
    {
      var Command:ICommand = new event.Command as ICommand;
      Command.execute(event.parameters);
    }
  }
}