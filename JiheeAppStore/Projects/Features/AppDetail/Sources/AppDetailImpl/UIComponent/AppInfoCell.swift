//
//  AppInfoCell.swift
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

final class AppInfoCell: BaseCollectionViewCell {
  
  // MARK: - Properties
  
  weak var listener: AppInfoListener?
  
  private var disposeBag: DisposeBag = DisposeBag()
  private var appID: String?
  private var link: String?
  
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
    }
    .build()
  
  private let titleLabel = UILabel()
    .builder
    .with {
      $0.font = .title2
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
  
  private let shareButton = UIButton()
    .builder
    .with {
      $0.setImage(.init(systemName: "square.and.arrow.up"), for: .normal)
      $0.tintColor = .black90
    }
    .build()
  
  private let downloadButton = UIButton()
    .builder
    .with {
      $0.setTitle("받기", for: .normal)
      $0.setTitleColor(.text, for: .normal)
      $0.clipsToBounds = true
      $0.layer.cornerRadius = 15
      $0.backgroundColor = .kakaoBankYellow
      $0.titleLabel?.font = .custom(.medium, 12)
    }
    .build()
  
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
  }
  
  // MARK: - Function
  
  func fetchAppInfo(_ information: AppInfoSummary) {
    handleAppImage(information.artworkUrl100)
    titleLabel.text = information.trackName
    descriptionLabel.text = information.genres.joined()
    appID = String(information.trackId)
    link = information.trackViewUrl
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
    
    shareButton.rx
      .tapWithPreventDuplication()
      .asDriver(onErrorDriveWith: .empty())
      .drive(with: self) { owner, _ in owner.listener?.didTapShareButton(owner.link ?? "") }
      .disposed(by: disposeBag)
  }
  
}

// MARK: - ConfigureUI

extension AppInfoCell {
  
  private func setupUI() {
    contentView.addSubviews(appImageView, shareButton, appInfoStackView, downloadButton)
    appInfoStackView.addArrangedSubviews(titleLabel, descriptionLabel)
    
    layout()
  }
  
  private func layout() {
    makeAppImageViewConstraints()
    makeShareButtonConstraints()
    makeAppInfoStackViewConstraints()
    makeDownloadButtonViewConstraints()
  }
  
  private func makeAppImageViewConstraints() {
    appImageView.snp.makeConstraints {
      $0.top.left.equalTo(contentView)
      $0.width.height.equalTo(100)
    }
  }
  
  private func makeShareButtonConstraints() {
    shareButton.snp.makeConstraints {
      $0.bottom.equalTo(appImageView)
      $0.right.equalTo(contentView).offset(-20)
      $0.size.equalTo(40)
    }
  }
  
  private func makeAppInfoStackViewConstraints() {
    appInfoStackView.snp.makeConstraints {
      $0.top.equalTo(appImageView)
      $0.left.equalTo(appImageView.snp.right).offset(20)
      $0.right.equalTo(shareButton.snp.left).offset(-20)
    }
  }
  
  private func makeDownloadButtonViewConstraints() {
    downloadButton.snp.makeConstraints {
      $0.bottom.equalTo(appImageView)
      $0.left.equalTo(appImageView.snp.right).offset(20)
      $0.width.equalTo(50)
      $0.height.equalTo(30)
    }
  }
  
}

protocol AppInfoListener: AnyObject {
  func didTapShareButton(_ url: String)
}
