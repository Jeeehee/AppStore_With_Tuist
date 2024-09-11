//
//  KeywordFilterTableView.swift
//  Home
//
//  Created by Jihee hwang on 9/10/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import UI
import AppFoundation

final class KeywordFilterTableView: BaseTableViewCell {
  
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
  
  private let underLine = UIView()
    .builder
    .backgroundColor(.line)
    .build()
  
  // MARK: - Initialization
  
  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
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

extension KeywordFilterTableView {
  
  private func setupUI() {
    contentView.addSubviews(searchImageView, keywordLabel, underLine)
    
    layout()
  }
  
  private func layout() {
    makeSearchImageViewConstraints()
    makeKeywordLabelConstraints()
  }
  
  private func makeSearchImageViewConstraints() {
    searchImageView.snp.makeConstraints {
      $0.left.equalToSuperview().offset(20)
      $0.centerY.equalToSuperview()
      $0.width.height.equalTo(10)
    }
  }
  
  private func makeKeywordLabelConstraints() {
    keywordLabel.snp.makeConstraints {
      $0.left.equalTo(searchImageView.snp.right).offset(7)
      $0.right.equalToSuperview().offset(-20)
      $0.centerY.equalToSuperview()
      $0.height.equalTo(50)
    }
  }
  
  private func makeUnderLineConstraints() {
    underLine.snp.makeConstraints {
      $0.width.equalToSuperview().offset(-20)
      $0.bottom.equalToSuperview()
      $0.height.equalTo(1)
    }
    
  }
}
