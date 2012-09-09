package com.baseProject
{
  import com.baseProject.controller.Controller;
  import com.baseProject.controller.commands.*;
  import com.baseProject.events.FullscreenEvent;
  import com.baseProject.model.Model;
  import com.baseProject.view.View;

  import com.redmvc.events.CommandEvent;
  import com.redmvc.interfaces.IApplication;
  import com.redmvc.managers.*;
  
  import flash.display.Stage;
  import flash.events.Event;
  import flash.events.FullScreenEvent;
  
  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class Application implements IApplication
  {
    public static const NAME:String = "Application";
    public static var xmlPath:String;
    public static var stageWidth:Number;
    public static var stageHeight:Number;
    public static var fullscreen:Boolean;
    public static var embeddedFonts:Boolean;
    
    private static var _application:Application;
    private static var _allowInstantiation:Boolean;
    private var _applicationManager:ApplicationManager;
    private var _dataManager:DataManager;
    private var _stageManager:StageManager;
    private var _commandManager:CommandManager;
    private var _model:Model;
    private var _view:View;
    
    public function Application()
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
    
    public static function getInstance():Application
    {
      if (!_application)
      {
        _allowInstantiation = true;
        _application = new Application();
      }
      
      return _application;
    }
    
    public function initialize(root:Object):void
    {
      var model:Model = new Model();
      var view:View = new View();
      var controller:Controller = new Controller();
      view.name = "view";
      root.addChild(view);
      
      _applicationManager = ApplicationManager.getInstance();
      _applicationManager.addEventListener(ApplicationManager.INITIALIZED, applicationInitialized);
      _applicationManager.initialize(root.stage, model, view, controller);
    }
    
    public function applicationInitialized(event:Event):void
    {
      _applicationManager.removeEventListener(ApplicationManager.INITIALIZED, applicationInitialized);
      
      _dataManager = DataManager.getInstance();
      _stageManager = StageManager.getInstance();
      _commandManager = CommandManager.getInstance();
      _model = _dataManager.model as Model;
      _view = _stageManager.view as View;

      //example
      _applicationManager.executeCommand(new CommandEvent(LoadXMLCommand, {xmlPath: xmlPath, callback: xmlLoaded}));
    }
    
    //example:
    private function xmlLoaded(xml:XML):void
    {
      _model.parseData(xml);
      
      setGlobalProperties();
      addGlobalListeners();
      start();
    }
    
    //example:
    private function setGlobalProperties():void
    {
      stageWidth = _applicationManager.stage.stageWidth;
      stageHeight = _applicationManager.stage.stageHeight;
      embeddedFonts = _model.applicationVO.embeddedFonts;
    }
    
    //example:
    private function addGlobalListeners():void
    {
      _applicationManager.stage.addEventListener(Event.RESIZE, onResize);
      _applicationManager.stage.addEventListener(FullscreenEvent.FULLSCREEN, onFullscreen);
      
      function onResize(event:Event):void
      {
        stageWidth = _applicationManager.stage.stageWidth;
        stageHeight = _applicationManager.stage.stageHeight;
        _applicationManager.executeCommand(new CommandEvent(ResizeCommand, {width:_applicationManager.stage.stageWidth, height:_applicationManager.stage.stageHeight}));
      }
      
      function onFullscreen(event:FullscreenEvent):void
      {
        _applicationManager.executeCommand(new CommandEvent(FullscreenCommand, {video:event.fullscreenType, rectangle:event.rectangle}));
      }
    }
    
    //example:
    private function start():void
    {
      _applicationManager.executeCommand(new CommandEvent(PreloadCommand));
    }
  }
}