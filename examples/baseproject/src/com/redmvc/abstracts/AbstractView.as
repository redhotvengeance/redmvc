package com.redmvc.abstracts
{
  import com.redmvc.interfaces.IView;
  import com.redmvc.managers.ApplicationManager;

  import flash.display.Sprite;
  import flash.display.Stage;
  import flash.events.Event;
  
  /**
   * RedMVC
   * Version 1.0.0
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class AbstractView extends Sprite implements IView
  {
    public static const NAME:String = "View";
    public static const INITIALIZED:String = "initialized";
    
    public static var _applicationManager:ApplicationManager;
    
    public function initialize():void
    {
      _applicationManager = ApplicationManager.getInstance();
      dispatchEvent(new Event(INITIALIZED));
    }
  }
}