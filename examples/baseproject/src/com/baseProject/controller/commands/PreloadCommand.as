//example:
package com.baseProject.controller.commands
{
  import com.baseProject.Application;
  import com.baseProject.model.Model;
  import com.baseProject.view.View;
  
  import com.redmvc.interfaces.ICommand;
  import com.redmvc.managers.DataManager;
  import com.redmvc.managers.StageManager;
  
  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class PreloadCommand implements ICommand
  {
    public static const NAME:String = "PreloadCommand";
    
    public function execute(parameters:Object):void
    {
      var model:Model = DataManager.getInstance().model as Model;
      var view:View = StageManager.getInstance().view as View;
      view.preload(model.preloadVO);
    }
  }
}