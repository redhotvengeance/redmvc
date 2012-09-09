//example:
package com.baseProject.model.valueObjects
{
  import com.baseProject.abstracts.AbstractVO;
  
  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class ApplicationVO extends AbstractVO
  {
    public var embeddedFonts:Boolean;
    
    public function ApplicationVO(xml:XML)
    {
      super(xml);
      
      if (xml.embeddedFont == "true")
      {
        embeddedFonts = true;
      }
    }
  }
}