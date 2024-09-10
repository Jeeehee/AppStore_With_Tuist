//
//  RecentKeywordCollectionViewCell.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit
import SnapKit

import UI
import AppFoundation

final class RecentKeywordCollectionViewCell: BaseCollectionViewCell {
  
  // MARK: - UI
  
  private let searchImageView = UIImageView()
    .builder
    .contentMode(.scaleAspectFill)
    .image(.search)
    .build()
  
  private let keywordLabel = UILabel()
    .builder
    .font(.detail_Regualr)
    .textColor(.black)
    .build()
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
  }
  
  override func prepareForReuse() {
    keywordLabel.text = nil
  }
  
  // MARK: - Function
  
  func fetchData(recentKeyword: String) {
    keywordLabel.text = recentKeyword
  }
  
}

// MARK: - ConfigureUI

extension RecentKeywordCollectionViewCell {
  
  private func setupUI() {
    contentView.addSubviews(searchImageView, keywordLabel)
    
    setupContentView()
    layout()
  }
  
  private func setupContentView() {
    contentView.layer.cornerRadius = 25
    contentView.layer.borderWidth = 1
    contentView.layer.borderColor = UIColor.line.cgColor
  }
  
  private func layout() {
    makeSearchImageViewConstraints()
    makeKeywordLabelConstraints()
  }
  
  private func makeSearchImageViewConstraints() {
    searchImageView.snp.makeConstraints {
      $0.left.equalToSuperview().offset(20)
      $0.centerY.equalToSuperview()
      $0.width.height.equalTo(14)
    }
  }
  
  private func makeKeywordLabelConstraints() {
    keywordLabel.snp.makeConstraints {
      $0.left.equalTo(searchImageView.snp.right).offset(7)
      $0.right.equalToSuperview().offset(-20)
      $0.centerY.equalToSuperview()
    }
  }
}

