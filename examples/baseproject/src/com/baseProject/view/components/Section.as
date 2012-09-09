//example:
package com.baseProject.view.components 
{
  import com.baseProject.model.valueObjects.SectionVO;

  import flash.display.Sprite;
  
  /**
   * @author Ian Lollar, rhv@redhotvengeance.com
   * Copyright (c) 2012, Ian Lollar. All rights reserved.
   */
  public class Section extends Sprite
  {
    public function Section(sectionVO:SectionVO) 
    {
      var sprite:Sprite = new Sprite();
      sprite.graphics.beginFill(sectionVO.squareColor);
      sprite.graphics.drawRect(0, 0, 50, 50);
      sprite.graphics.endFill();
      addChild(sprite);
    }
  }
}