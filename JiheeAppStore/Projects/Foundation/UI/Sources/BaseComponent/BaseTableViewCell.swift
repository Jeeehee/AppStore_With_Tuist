//
//  BaseTableViewCell.swift
//  UI
//
//  Created by Jihee hwang on 9/10/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

open class BaseTableViewCell:
  UITableViewCell,
  Reusable
{
  
  public static var identifier: String {
    return "\(self)"
  }
  
  // MARK: - Initialize
  
  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
  }
  
  @available(*, unavailable)
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public static func register(_ target: UITableView) {
    target.register(Self.self, forCellReuseIdentifier: Self.identifier)
  }
  
  // MARK: - ConfigureUI
  
  private func setupUI() {
    layout()
  }
  
  private func layout() { }
  
}

