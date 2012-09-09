package com.redmvc.managers
{
  import com.redmvc.events.CommandEvent;
  import com.redmvc.interfaces.IController;
  import com.redmvc.interfaces.IModel;
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
  public class ApplicationManager extends EventDispatcher
  {
    public static const NAME:String = "ApplicationManager";
    public static const INITIALIZED:String = "initialized";
    public var stage:Stage;
    
    private static var _applicationManager:ApplicationManager;
    private var _commandManager:CommandManager;
    private var _dataManager:DataManager;
    private var _controller:IController;
    private var _model:IModel;
    private var _view:IView;
    private var _stageManager:StageManager;
    
    public static function getInstance():ApplicationManager
    {
      if (!_applicationManager) _applicationManager = new ApplicationManager();
      
      return _applicationManager;
    }
    
    public function initialize(stage:Stage, model:IModel, view:IView, controller:IController):void
    {
      this.stage = stage;
      _model = model;
      _view = view;
      _controller = controller;
      
      _dataManager = DataManager.getInstance();
      _dataManager.addEventListener(DataManager.INITIALIZED, modelInitialized);
      _dataManager.initialize(_model);
    }
    
    public function executeCommand(event:CommandEvent):void
    {
      _commandManager.controller.executeCommand(event);
    }
    
    private function modelInitialized(event:Event):void
    {
      _dataManager.removeEventListener(DataManager.INITIALIZED, modelInitialized);
      
      _stageManager = StageManager.getInstance();
      _stageManager.addEventListener(StageManager.INITIALIZED, viewInitialized);
      _stageManager.initialize(_view);
    }
    
    private function viewInitialized(event:Event):void
    {
      _stageManager.removeEventListener(StageManager.INITIALIZED, viewInitialized);
      
      _stageManager.addEventListener(CommandEvent.COMMAND, executeCommand);
      _commandManager = CommandManager.getInstance();
      _commandManager.addEventListener(CommandManager.INITIALIZED, controllerInitialized);
      _commandManager.initialize(_controller);
    }
    
    private function controllerInitialized(event:Event):void
    {
      dispatchEvent(new Event(INITIALIZED));
    }
  }
}