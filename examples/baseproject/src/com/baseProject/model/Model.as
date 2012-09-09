package com.baseProject.model
{
  import com.baseProject.model.valueObjects.*;
  
  import com.redmvc.interfaces.IModel;

  import flash.events.EventDispatcher;

  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class Model extends EventDispatcher implements IModel
  {
    //example:
    public var applicationVO:ApplicationVO;
    public var preloadVO:PreloadVO;
    public var sectionVO:SectionVO;
    
    public function parseData(xml:XML):void
    {
      //example:
      applicationVO = new ApplicationVO(XML(xml.application));
      preloadVO = new PreloadVO(xml);
      sectionVO = new SectionVO(XML(xml.sections.section));
    }
  }
}