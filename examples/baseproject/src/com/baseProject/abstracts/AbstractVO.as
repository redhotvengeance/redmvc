package com.baseProject.abstracts 
{
  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class AbstractVO
  {
    public var id:String;
    public var active:Boolean;
    public var visible:Boolean;
    
    public function AbstractVO(xml:XML)
    {
      id = xml.@id.toString();
      
      if (xml.@active.toString() == "true")
      {
        active = true;
      }
      
      if (xml.@visible.toString() == "true")
      {
        visible = true;
      }
    }
  }
}