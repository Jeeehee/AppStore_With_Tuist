//
//  BaseView.swift
//  UI
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import RxSwift

open class BaseView:
  UIView,
  HasDisposeBag
{
  
  // MARK: - Properties
  
  public var disposeBag = DisposeBag()
  
  private(set) var didSetupConstrints: Bool = false
  
  // MARK: - Initialization & deinitialization
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }
  
  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    assertionFailure("init(coder:) has not been implemented")
    super.init(coder: aDecoder)
  }
  
  open override func updateConstraints() {
    setupConstraintsIfNeeded()
    super.updateConstraints()
  }
  
  open func initialize() {
    setNeedsUpdateConstraints()
  }

}

// MARK: - Layout

extension BaseView {
  
  func setupUI() {
    
  }
  
  private func setupConstraintsIfNeeded() {
    guard !didSetupConstrints else { return }
    setupUI()
    didSetupConstrints = true
  }
}
