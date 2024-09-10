//
//  AppRootViewController.swift
//  Application
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import RIBs
import RxSwift
import SnapKit

import UI
import AppFoundation

// MARK: - AppRootPresentableListener

protocol AppRootPresentableListener: AnyObject {}

// MARK: - AppRootViewController

final class AppRootViewController:
  BaseViewController,
  AppRootPresentable,
  AppRootViewControllable
{
  // MARK: - Properties
  
  weak var listener: AppRootPresentableListener?
  
  // MARK: - UI
  
  private let splashImageView = UIImageView()
    .builder
    .contentMode(.scaleAspectFill)
    .image(.splash)
    .build()
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
}

// MARK: - ConfigureUI

extension AppRootViewController {
  
  private func setupUI() {
    view.addSubview(splashImageView)
    
    layout()
  }
  
  private func layout() {
    splashImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
}
