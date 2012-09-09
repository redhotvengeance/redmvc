package com.redmvc.managers
{
  import com.redmvc.abstracts.AbstractView;
  import com.redmvc.events.CommandEvent;
  import com.redmvc.interfaces.IView;

  import flash.display.Stage;
  import flash.events.Event;
  import flash.events.EventDispatcher;
  
  /**
   * RedMVC
   * Version 1.0.0
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class StageManager extends EventDispatcher
  {
    public static const NAME:String = "StageManager";
    public static const INITIALIZED:String = "initialized";
    public var view:IView;
    
    private static var _applicationManager:ApplicationManager;
    private static var _allowInstantiation:Boolean;
    private static var _stageManager:StageManager;
    
    public function StageManager()
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
    
    public static function getInstance():StageManager
    {
      if (!_stageManager)
      {
        _allowInstantiation = true;
        _stageManager = new StageManager();
      }
      
      return _stageManager;
    }
    
    public function initialize(view:IView):void
    {
      if (!this.view)
      {
        _applicationManager = ApplicationManager.getInstance();
        this.view = view;
        this.view.addEventListener(CommandEvent.COMMAND, commandIssued);
        this.view.addEventListener(AbstractView.INITIALIZED, viewInitialized);
        this.view.initialize();
      }
      else
      {
        throw new Error("The view has already been initialized.");
      }
      
      function viewInitialized(event:Event):void
      {
        dispatchEvent(new Event(INITIALIZED));
      }
    }
    
    private function commandIssued(event:CommandEvent):void
    {
      dispatchEvent(new CommandEvent(event.Command, event.parameters));
    }
  }
}