//example:
package com.baseProject.model.valueObjects
{
  import com.baseProject.Application;

  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class PreloadVO
  {
    public var preloadArray:Array;
    
    public function PreloadVO(xml:XML)
    {
      preloadArray = new Array();
      
      var fileURLList:XMLList = xml.descendants("fileURL");
      
      for each (var item:XML in fileURLList)
      {
        if (item.@preload == "true")
        {
          preloadArray.push(item.toString());
        }
      }
    }
  }
}