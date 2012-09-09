package com.redmvc.managers
{
  import com.redmvc.interfaces.IController;

  import flash.events.Event;
  import flash.events.EventDispatcher;
  
  /**
   * RedMVC
   * Version 1.0.0
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class CommandManager extends EventDispatcher
  {
    public static const NAME:String = "CommandManager";
    public static const INITIALIZED:String = "initialized";
    public var controller:IController;
    
    private static var _allowInstantiation:Boolean;
    private static var _commandManager:CommandManager;
    
    public function CommandManager()
    {
      if (!_allowInstantiation)
      {
        throw new Error(NAME + " is a Singleton. Use " + NAME + ".getInstance() instead of new.");
      }
      else
      {
        _allowInstantiation = false;
      }
    }
    
    public static function getInstance():CommandManager
    {
      if (!_commandManager)
      {
        _allowInstantiation = true;
        _commandManager = new CommandManager();
      }
      
      return _commandManager;
    }
    
    public function initialize(controller:IController):void
    {
      if (!this.controller)
      {
        this.controller = controller;
        dispatchEvent(new Event(INITIALIZED));
      }
      else
      {
        throw new Error("The controller has already been initialized.");
      }
    }
  }
}