//
//  CustomStackView.swift
//  AppDetail
//
//  Created by Jihee hwang on 9/11/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import SnapKit

import UI

final class CustomStackView: UIStackView {
  
  // MARK: - Views
  
  lazy var stackView = UIStackView()
    .builder
    .with {
      $0.axis = .vertical
      $0.alignment = .center
      $0.spacing = 10
    }
    .build()
  
  let titleLabel = UILabel()
    .builder
    .with {
      $0.font = .detail_Medium
      $0.textColor = .text
      $0.textAlignment = .center
    }
    .build()
  
  let descriptionLabel = UILabel()
    .builder
    .with {
      $0.numberOfLines = 0
      $0.font = .body_Bold
      $0.textColor = .text
      $0.textAlignment = .center
    }
    .build()
  
  // MARK: - Initialize
  
  init(alignment: UIStackView.Alignment = .center) {
    super.init(frame: .zero)
    
    self.alignment = alignment
    
    setupUI()
  }
  
  @available(*, unavailable)
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - ConfigureUI
  
  private func setupUI() {
    layer.masksToBounds = true
    layer.cornerRadius = 10
    layer.borderWidth = 1
    layer.borderColor = UIColor.line.cgColor
    
    addArrangedSubview(stackView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(descriptionLabel)
  }
  
  private func layout() {
    stackView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(30)
    }
  }
}

extension CustomStackView {
  func fetchData(title: String, description: String) {
    titleLabel.text = title
    descriptionLabel.text = description
  }
}
