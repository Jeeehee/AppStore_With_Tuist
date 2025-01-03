//
//  AppInfoSummaryCollectionViewCell.swift
//  Home
//
//  Created by Jihee hwang on 9/10/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import SnapKit
import RxSwift
import Kingfisher

import UI
import AppFoundation
import Entities

final class AppInfoSummaryCollectionViewCell: BaseCollectionViewCell {
  
  // MARK: - Properties
  
  private var disposeBag: DisposeBag = DisposeBag()
  private var appID: String?
  
  // MARK: - UI
  
  private let appImageView = UIImageView()
    .builder
    .with {
      $0.clipsToBounds = true
      $0.layer.cornerRadius = 15
      $0.contentMode = .scaleAspectFill
      $0.backgroundColor = .black20
    }
    .build()
  
  private let appInfoStackView = UIStackView()
    .builder
    .with {
      $0.alignment = .leading
      $0.axis = .vertical
      $0.spacing = 5
      $0.distribution = .fillProportionally
    }
    .build()
  
  private let ratingStackView = UIStackView()
    .builder
    .with {
      $0.alignment = .leading
      $0.axis = .horizontal
      $0.spacing = 5
    }
    .build()
  
  private let titleLabel = UILabel()
    .builder
    .with {
      $0.numberOfLines = 0
      $0.font = .body_Bold
      $0.textColor = .text
    }
    .build()
  
  private let descriptionLabel = UILabel()
    .builder
    .with {
      $0.font = .detail_Medium
      $0.textColor = .text
    }
    .build()
  
  private let starImageView = UIImageView()
    .builder
    .image(.favorite)
    .build()
  
  private let ratingLabel = UILabel()
    .builder
    .with {
      $0.font = .detail_Regualr
      $0.textColor = .text
    }
    .build()
  
  private let ratingCountLabel = UILabel()
    .builder
    .with {
      $0.font = .detail_Regualr
      $0.textColor = .text
    }
    .build()
  
  private let downloadButton = UIButton()
    .builder
    .with {
      $0.setTitle("받기", for: .normal)
      $0.setTitleColor(.text, for: .normal)
      $0.clipsToBounds = true
      $0.layer.cornerRadius = 15
      $0.backgroundColor = .black20
      $0.titleLabel?.font = .custom(.medium, 12)
    }
    .build()
  
  private let screenshotsView = MutipleImageView(numberOfImageView: 3)
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
    bind()
  }
  
  override func prepareForReuse() {
    appImageView.image = nil
    titleLabel.text = nil
    descriptionLabel.text = nil
    ratingLabel.text = nil
    ratingCountLabel.text = nil
  }
  
  // MARK: - Function
  
  func fetchAppInfoSummary(_ information: AppInfoSummary) {
    handleAppImage(information.artworkUrl100)
    titleLabel.text = information.trackName
    descriptionLabel.text = information.genres.joined()
    ratingLabel.text = String(format: "%.1f", information.averageUserRating)
    ratingCountLabel.text = "(\(String.numberFormatting(number: information.userRatingCount)))"
    screenshotsView.fetchImageViews(information.screenshotUrls)
    appID = String(information.trackId)
  }
  
  private func handleAppImage(_ url: String) {
    guard let url = URL(string: url) else { return }
    appImageView.kf.setImage(with: url, options: [.cacheMemoryOnly])
  }
  
  private func bind() {
    downloadButton.rx
      .tapWithPreventDuplication()
      .asDriver(onErrorDriveWith: .empty())
      .drive { [weak self] _ in
        guard let appID = self?.appID,
              let link = URL(string: "itms-apps://itunes.apple.com/app/id\(appID)") else {
          return
        }
        
        UIApplication.shared.open(link)
      }
      .disposed(by: disposeBag)
  }
}

// MARK: - ConfigureUI

extension AppInfoSummaryCollectionViewCell {
  
  private func setupUI() {
    contentView.addSubviews(appImageView, appInfoStackView, downloadButton, screenshotsView)
    appInfoStackView.addArrangedSubviews(titleLabel, descriptionLabel, ratingStackView)
    ratingStackView.addArrangedSubviews(starImageView, ratingLabel, ratingCountLabel)
    
    layout()
  }
  
  private func layout() {
    makeAppImageViewConstraints()
    makeDownloadButtonViewConstraints()
    makeAppInfoStackViewConstraints()
    makeScreenshotsViewConstraints()
    makeStarImageViewConstraints()
  }
  
  private func makeAppImageViewConstraints() {
    appImageView.snp.makeConstraints {
      $0.top.left.equalTo(contentView).offset(20)
      $0.width.height.equalTo(80)
    }
  }
  
  private func makeDownloadButtonViewConstraints() {
    downloadButton.snp.makeConstraints {
      $0.centerY.equalTo(appImageView)
      $0.right.equalTo(contentView).offset(-20)
      $0.width.equalTo(50)
      $0.height.equalTo(30)
    }
  }
  
  private func makeAppInfoStackViewConstraints() {
    appInfoStackView.snp.makeConstraints {
      $0.centerY.equalTo(appImageView)
      $0.left.equalTo(appImageView.snp.right).offset(20)
      $0.right.equalTo(downloadButton.snp.left).offset(-20)
    }
  }
  
  private func makeScreenshotsViewConstraints() {
    screenshotsView.snp.makeConstraints {
      $0.top.equalTo(appInfoStackView.snp.bottom).offset(20)
      $0.left.right.bottom.equalToSuperview()
    }
  }
  
  private func makeStarImageViewConstraints() {
    starImageView.snp.makeConstraints {
      $0.size.equalTo(15)
      $0.centerY.equalToSuperview()
    }
  }
}

