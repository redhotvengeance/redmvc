//example:
package com.baseProject.model.valueObjects
{
  import com.baseProject.Application;

  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class SectionVO
  {
    public var squareColor:uint;
    
    public function SectionVO(xml:XML)
    {
      squareColor = uint(xml.square.color.toString());
    }
  }
}