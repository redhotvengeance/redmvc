package com.baseProject.view
{
  import com.baseProject.controller.commands.CreateSectionCommand;
  import com.baseProject.model.valueObjects.PreloadVO;
  import com.baseProject.model.valueObjects.SectionVO;
  import com.baseProject.view.components.Section;
  
  import com.redmvc.abstracts.AbstractView;
  import com.redmvc.events.CommandEvent;

  import flash.display.SpreadMethod;
  import flash.display.Sprite;
  import flash.geom.Rectangle;

  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class View extends AbstractView
  {
    public static const NAME:String = "View";
    
    public function resize(stageWidth:Number, stageHeight:Number):void
    {
      trace("Resized: " + stageWidth + " by " + stageHeight);
    }
    
    public function fullscreen(fullscreenType:String, rectangle:Rectangle):void
    {
      
    }
    
    //example:
    public function preload(data:PreloadVO):void
    {
      trace("Files to preload: " + data.preloadArray);

      _applicationManager.executeCommand(new CommandEvent(CreateSectionCommand));
    }
    
    //example:
    public function createSection(sectionVO:SectionVO):void
    {
      var section:Section = new Section(sectionVO);
      addChild(section);
    }
  }
}