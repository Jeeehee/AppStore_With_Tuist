//
//  LayoutFactory.swift
//  AppDetail
//
//  Created by Jihee hwang on 9/11/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

final class LayoutFactory {
  
  static func createLayout() -> UICollectionViewCompositionalLayout {
    return UICollectionViewCompositionalLayout { (index, _) -> NSCollectionLayoutSection? in
      guard let sections = SectionType(rawValue: index) else { return nil }
      
      switch sections {
      case .appInfomation: return makeAppInfomationSection()
      case .detailInfo : return makeDetailInfoSection()
      case .image: return makeImageSection()
      }
    }
  }
  
  static func makeAppInfomationSection() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .estimated(80))
    
    let groupSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .estimated(80))
    
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let group = NSCollectionLayoutGroup.vertical(
      layoutSize: groupSize,
      subitems: [item])
    
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets.bottom = 30
    
    return section
  }
  
  static func makeDetailInfoSection() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .estimated(80))
    
    let groupSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .estimated(80))
    
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let group = NSCollectionLayoutGroup.vertical(
      layoutSize: groupSize,
      subitems: [item])
    
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets.bottom = 30
    
    return section
  }
  
  static func makeImageSection() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(0.9),
      heightDimension: .fractionalHeight(0.8))
    
    let groupSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(0.9),
      heightDimension: .fractionalHeight(0.9))
    
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let group = NSCollectionLayoutGroup.vertical(
      layoutSize: groupSize,
      subitems: [item])
    
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .groupPaging
    
    return section
  }
  
  
}
