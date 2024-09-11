//
//  AppSearchResultViewController.swift
//  AppSearchResult
//
//  Created by Jihee hwang on 9/10/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import RIBs
import RxSwift
import RxCocoa
import RxRelay
import SnapKit

import UI
import AppFoundation

protocol AppSearchResultPresentableListener: AnyObject {
  func loadData()
}

final class AppSearchResultViewController:
  BaseViewController,
  AppSearchResultPresentable,
  AppSearchResultViewControllable {
  
  weak var listener: AppSearchResultPresentableListener?
  
  // MARK: - UI
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    bindLoadData()
  }
}

// MARK: - Bind Action

extension AppSearchResultViewController {
  private func bindLoadData() {
    rx.viewWillAppear
      .throttle(.seconds(1), latest: false, scheduler: MainScheduler.asyncInstance)
      .asDriver(onErrorDriveWith: .empty())
      .drive(with: self) { owner, _ in
        owner.listener?.loadData()
      }
      .disposed(by: disposeBag)
  }
}

// MARK: - Bind State

extension AppSearchResultViewController {
  func bindSearchResult() {

  }
}

// MARK: - ConfigureUI

extension AppSearchResultViewController {
  
  private func setupUI() {
    
    layout()
  }
  
  private func layout() {
  }
  
}
