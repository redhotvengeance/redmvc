package com.redmvc.managers
{
  import com.redmvc.interfaces.IModel;

  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.net.URLLoader;
  import flash.net.URLRequest;
  
  /**
   * RedMVC
   * Version 1.0.0
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class DataManager extends EventDispatcher
  {
    public static const NAME:String = "DataManager";
    public static const INITIALIZED:String = "initialized";
    public static const XML_LOADED:String = "xmlLoaded";
    public var model:IModel;
    
    private static var _allowInstantiation:Boolean;
    private static var _dataManager:DataManager;
    
    public function DataManager()
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
    
    public static function getInstance():DataManager
    {
      if (!_dataManager)
      {
        _allowInstantiation = true;
        _dataManager = new DataManager();
      }
      
      return _dataManager;
    }
    
    public function initialize(model:IModel):void
    {
      if (!this.model)
      {
        this.model = model;
        
        dispatchEvent(new Event(INITIALIZED));
      }
      else
      {
        throw new Error("The model has already been initialized.");
      }
    }
    
    public function loadXML(xmlURL:String):void
    {
      var xmlLoader:URLLoader = new URLLoader();
      xmlLoader.addEventListener(Event.COMPLETE, onXMLLoaded);
      xmlLoader.load(new URLRequest(xmlURL));
    }
    
    private function onXMLLoaded(event:Event):void
    {
      var xml:XML = new XML(event.target.data);
      model.parseData(xml);
      dispatchEvent(new Event(XML_LOADED));
    }
  }
}