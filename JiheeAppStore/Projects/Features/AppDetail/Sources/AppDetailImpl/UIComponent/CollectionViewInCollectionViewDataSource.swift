//
//  CollectionViewInCollectionViewDataSource.swift
//  AppDetail
//
//  Created by Jihee hwang on 9/11/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import Entities

final class CollectionViewInCollectionViewDataSource: NSObject, UICollectionViewDataSource {
  var mock: AppInfoDetail = .mock
  var data: AppInfoDetail?
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    3
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let data = data else {
     return 0
    }
    
    switch section {
    case 0:
      return 1
    case 1:
      return 1
    default:
      return data.appInfoSummary.screenshotUrls.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let sections = SectionType.init(rawValue: indexPath.section),
          let data = data else { return UICollectionViewCell() }
    
    guard let sections = SectionType.init(rawValue: indexPath.section) else { return UICollectionViewCell() }
    switch sections {
    case .appInfomation:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppInfoCell.identifier, for: indexPath) as? AppInfoCell else { return UICollectionViewCell() }
      cell.fetchAppInfo(data.appInfoSummary)
      return cell
      
    case .detailInfo:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailInfoCell.identifier, for: indexPath) as? DetailInfoCell else { return UICollectionViewCell() }
      cell.fetchDetail(data)
      return cell
      
    case .image:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else { return UICollectionViewCell() }
      cell.fetchDetail(data.appInfoSummary.screenshotUrls)
      return cell
    }
  }
}

