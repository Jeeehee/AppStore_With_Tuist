//
//  HomeViewController.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
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

protocol HomePresentableListener: AnyObject { }

final class HomeViewController:
  BaseViewController,
  HomePresentable,
  HomeViewControllable,
  KeyboardAddable
{
  // MARK: - Properties
  
  weak var listener: HomePresentableListener?
  
  // MARK: - UI
  
  private let searchBarContainerView = UIView()
  private let recentHistoryContainerView = UIView()
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addKeyboardObserver()
    setupUI()
  }
  
  deinit {
    removeKeyboardObserver()
  }
}

// MARK: - ConfigureUI

extension HomeViewController {
  
  private func setupUI() {
    view.addSubview(searchBarContainerView)
    view.addSubview(recentHistoryContainerView)
    
    layout()
  }
  
  private func layout() {
    makeSearchBarContainerViewConstraints()
    makeRecentHistoryContainerViewConstraints()
  }
  
  private func makeSearchBarContainerViewConstraints() {
    searchBarContainerView.snp.makeConstraints {
      $0.top.width.equalToSuperview()
      $0.height.equalTo(220)
    }
  }
  
  private func makeRecentHistoryContainerViewConstraints() {
    recentHistoryContainerView.snp.makeConstraints {
      $0.top.equalTo(searchBarContainerView.snp.bottom)
      $0.width.bottom.equalToSuperview()
    }
  }
  
}

// MARK: - Add Child View

extension HomeViewController {
  func addSearchBarView(_ view: ViewControllable) {
    addChildViewController(container: searchBarContainerView, child: view)
  }
  
  func addRecentSearchHistoryView(_ view: ViewControllable) {
    addChildViewController(container: recentHistoryContainerView, child: view)
  }
}
