//
//  MutipleImageView.swift
//  Home
//
//  Created by Jihee hwang on 9/10/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import SnapKit
import Kingfisher

import UI
import AppFoundation

final class MutipleImageView: UIView {
  
  // MARK: - UI
  
  private let imageStackView = UIStackView()
    .builder
    .with {
      $0.axis = .horizontal
      $0.distribution = .fillEqually
      $0.spacing = 10
    }
    .build()
  
  private let imageViews: [UIImageView]
  
  // MARK: - Initialization
  
  init(numberOfImageView: Int) {
    self.imageViews = (0..<numberOfImageView).map { _ in UIImageView() }
    super.init(frame: .zero)
    
    setupUI()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func fetchImageViews(_ urls: [String]) {
    zip(imageViews, urls).forEach { imageView, imageUrl in
      guard let url = URL(string: imageUrl) else { return }
      imageView.kf.setImage(with: url, options: [.cacheMemoryOnly])
    }
  }
}

// MARK: - ConfigureUI

extension MutipleImageView {
  
  private func setupUI() {
    addSubviews(imageStackView)
    
    setupImageViews()
    layout()
  }
  
  private func setupImageViews() {
    imageViews.enumerated().forEach { index, imageView in
      imageView.clipsToBounds = true
      imageView.layer.cornerRadius = 10
      imageView.contentMode = .scaleAspectFill
      
      imageStackView.addArrangedSubview(imageView)
    }
  }
  
  private func layout() {
    imageStackView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.left.equalToSuperview().offset(20)
      $0.right.equalToSuperview().offset(-20)
    }
  }
}
