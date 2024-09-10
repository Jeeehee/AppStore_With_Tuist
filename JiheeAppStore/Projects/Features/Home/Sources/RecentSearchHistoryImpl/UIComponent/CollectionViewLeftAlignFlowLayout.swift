//
//  CollectionViewLeftAlignFlowLayout.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

public final class CollectionViewLeftAlignFlowLayout: UICollectionViewFlowLayout {
  
  public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let attributes = super.layoutAttributesForElements(in: rect)
    var maxY: CGFloat = -1.0
    var leftMargin = sectionInset.left
    
    attributes?.forEach { layoutAttribute in
      if layoutAttribute.frame.origin.y >= maxY {
        leftMargin = sectionInset.left
      }
      
      layoutAttribute.frame.origin.x = leftMargin
      leftMargin += layoutAttribute.frame.width + minimumLineSpacing
      maxY = max(layoutAttribute.frame.maxY, maxY)
    }
    
    estimatedItemSize = CollectionViewLeftAlignFlowLayout.automaticSize
    
    return attributes
  }
  
}
