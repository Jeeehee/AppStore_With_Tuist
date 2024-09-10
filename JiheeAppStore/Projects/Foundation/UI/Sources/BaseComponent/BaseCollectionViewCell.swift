//
//  BaseCollectionViewCell.swift
//  UI
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

open class BaseCollectionViewCell:
  UICollectionViewCell,
  Reusable
{
  
  public static var identifier: String {
    return "\(self)"
  }
  
  // MARK: - Initialize
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupUI()
  }
  
  @available(*, unavailable)
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public static func register(_ target: UICollectionView) {
    target.register(Self.self, forCellWithReuseIdentifier: Self.identifier)
  }
  
  // MARK: - ConfigureUI
  
  private func setupUI() {
    layout()
  }
  
  private func layout() { }
  
}
