//
//  ImageCell.swift
//  AppDetail
//
//  Created by Jihee hwang on 9/11/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import SnapKit
import RxSwift
import Kingfisher

import UI
import AppFoundation
import Entities

final class ImageCell: BaseCollectionViewCell {
  
  // MARK: - Properties
  
  // MARK: - UI
  
  private let imageView = UIImageView()
    .builder
    .with {
      $0.clipsToBounds = true
      $0.layer.cornerRadius = 10
      $0.contentMode = .scaleAspectFill
      $0.backgroundColor = .black20
    }
    .build()
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    imageView.image = nil
  }
  
  // MARK: - Function
  
  func fetchDetail(_ imageURL: String) {
    guard let url = URL(string: imageURL) else { return }

    imageView.kf.setImage(with: url, options: [.cacheMemoryOnly])
  }
  
}

// MARK: - ConfigureUI

extension ImageCell {
  
  private func setupUI() {
    contentView.addSubview(imageView)
    
    layout()
  }
  
  private func layout() {
    imageView.snp.makeConstraints {
      $0.top.left.bottom.equalTo(contentView)
      $0.width.equalTo(contentView.snp.width)
    }
  }
}




