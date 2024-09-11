//
//  DetailInfoCell.swift
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

final class DetailInfoCell: BaseCollectionViewCell {
  
  // MARK: - Properties
  
  // MARK: - UI
  
  enum UI {
    static let itemWidth = (UIScreen.width - 50) / 3
    static let itemHeight = 80
  }
  
  private lazy var ratingStackView = CustomStackView()
  private lazy var centerStackView = CustomStackView()
  private lazy var ageStackView = CustomStackView()
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    ratingStackView.titleLabel.text = nil
    ratingStackView.descriptionLabel.text = nil
    centerStackView.titleLabel.text = nil
    centerStackView.descriptionLabel.text = nil
    ageStackView.titleLabel.text = nil
    ageStackView.descriptionLabel.text = nil
  }
  
  // MARK: - Function
  
  func fetchDetail(_ information: AppInfoDetail) {
    ratingStackView.fetchData(
      title: "\(String(format: "%.1f", information.appInfoSummary.averageUserRating))",
      description: "\(String.numberFormatting(number: information.appInfoSummary.userRatingCount))")
    centerStackView.fetchData(
      title: information.sellerName,
      description: "개발자")
    ageStackView.fetchData(
      title: information.contentAdvisoryRating,
      description: "연령")
  }
  
}

// MARK: - ConfigureUI

extension DetailInfoCell {
  
  private func setupUI() {
    contentView.addSubviews(ratingStackView, centerStackView, ageStackView)
    
    layout()
  }
  
  private func layout() {
    makeRatingStackViewConstraints()
    makeCenterStackViewConstraints()
    makeAgeStackViewConstraints()
  }
  
  private func makeRatingStackViewConstraints() {
    ratingStackView.snp.makeConstraints {
      $0.top.bottom.equalTo(contentView)
      $0.left.equalTo(contentView)
      $0.width.equalTo(UI.itemWidth)
      $0.height.equalTo(UI.itemHeight)
    }
  }
  
  private func makeCenterStackViewConstraints() {
    centerStackView.snp.makeConstraints {
      $0.top.bottom.centerX.equalTo(contentView)
      $0.width.equalTo(UI.itemWidth)
      $0.height.equalTo(UI.itemHeight)
    }
  }
  
  private func makeAgeStackViewConstraints() {
    ageStackView.snp.makeConstraints {
      $0.top.bottom.right.equalTo(contentView)
      $0.right.equalTo(contentView)
      $0.width.equalTo(UI.itemWidth)
      $0.height.equalTo(UI.itemHeight)
    }
  }
}



