//example:
package com.baseProject.controller.commands
{
  import com.baseProject.Application;
  import com.baseProject.view.View;

  import com.redmvc.interfaces.ICommand;
  import com.redmvc.managers.ApplicationManager;
  import com.redmvc.managers.DataManager;
  import com.redmvc.managers.StageManager;

  import flash.display.StageDisplayState;
  
  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class FullscreenCommand implements ICommand
  {
    public static const NAME:String = "FullscreenCommand";
    
    public function execute(parameters:Object):void
    {
      if (ApplicationManager.getInstance().stage.displayState == StageDisplayState.NORMAL)
      {
        Application.fullscreen = true;
      }
      else
      {
        Application.fullscreen = false;
      }
      
      var view:View = StageManager.getInstance().view as View;
      view.fullscreen(parameters.fullscreenType, parameters.rectangle);
    }
  }
}