package
{
  import com.baseProject.Application;
  
  import flash.display.Sprite;
  import flash.display.StageAlign;
  import flash.display.StageScaleMode;
  import flash.events.Event;
  
  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class Main extends Sprite
  {
    public static const NAME:String = "BaseProject";
    
    public function Main()
    {
      if (stage)
      {
        addedToStageHandler();
        }
        else
        {
            addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        }
    }
    
    private function addedToStageHandler(event:Event = null):void
    {
      if (event != null)
      {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
      }
      
      stage.align = StageAlign.TOP_LEFT;
      stage.scaleMode = StageScaleMode.NO_SCALE;
      
      //if AIR
      //stage.nativeWindow.activate();
      
      var application:Application = Application.getInstance();
      Application.xmlPath = "data/xml/baseProject.xml";
      application.initialize(this);
    }
  }
}