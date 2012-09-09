package com.baseProject.controller.commands
{
  import com.baseProject.Application;
  import com.baseProject.model.Model;
  
  import com.redmvc.interfaces.ICommand;
  import com.redmvc.managers.DataManager;

  import flash.events.Event;
  import flash.net.URLLoader;
  import flash.net.URLRequest;
  
  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class LoadXMLCommand implements ICommand
  {
    public static const NAME:String = "LoadXMLCommand";
    
    public function execute(parameters:Object):void
    {
      var callback:Function = parameters.callback;
      
      var xmlLoader:URLLoader = new URLLoader();
      xmlLoader.addEventListener(Event.COMPLETE, onXMLLoaded);
      xmlLoader.load(new URLRequest(parameters.xmlPath));
      
      function onXMLLoaded(event:Event):void
      {
        xmlLoader.removeEventListener(Event.COMPLETE, onXMLLoaded);
        var xml:XML = new XML(event.target.data);
        callback(xml);
      }
    }
  }
}