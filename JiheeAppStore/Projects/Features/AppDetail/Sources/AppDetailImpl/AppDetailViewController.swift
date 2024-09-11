//
//  AppDetailViewController.swift
//  AppDetail
//
//  Created by Jihee hwang on 9/11/24.
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
import Entities

protocol AppDetailPresentableListener: AnyObject {
  func loadData()
  func didTapBackButton()
}

final class AppDetailViewController:
  BaseViewController,
  AppDetailPresentable,
  AppDetailViewControllable
{
  
  weak var listener: AppDetailPresentableListener?
  private let collectionViewDataSource = CollectionViewInCollectionViewDataSource()
  
  // MARK: - UI
  
  private enum UI {
    static let defaultPadding = 20.0
    static let backButtonWidth = 15.0
    static let backButtonHeight = 20.0
  }

  private let backButton = UIBarButtonItem()
    .builder
    .with {
      $0.image = .arrowLeft
    }
    .build()
  
  private lazy var collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: LayoutFactory.createLayout())
    .builder
    .with {
      AppInfoCell.register($0)
      DetailInfoCell.register($0)
      ImageCell.register($0)
      $0.dataSource = collectionViewDataSource
    }
    .build()
  
  // MARK: - View Lifecycle
  
  override func viewWillDisappear(_ animated: Bool) {
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
    bindLoadData()
    bindDidTapBackButton()
  }
}

// MARK: - Bind Action

extension AppDetailViewController {
  private func bindLoadData() {
    rx.viewWillAppear
      .throttle(.seconds(1), latest: false, scheduler: MainScheduler.asyncInstance)
      .asDriver(onErrorDriveWith: .empty())
      .drive(with: self) { owner, _ in owner.listener?.loadData() }
      .disposed(by: disposeBag)
  }
  
  private func bindDidTapBackButton() {
    backButton.rx.tap
      .asDriver(onErrorDriveWith: .empty())
      .drive(with: self) { owner, _ in owner.listener?.didTapBackButton() }
      .disposed(by: disposeBag)
  }
}

// MARK: - Bind State

extension AppDetailViewController {
  func bindAppInfoDetail(_ informations: AppInfoDetail) {
    collectionViewDataSource.data = informations
  }
}

// MARK: - ConfigureUI

extension AppDetailViewController {
  
  private func setupUI() {
    navigationItem.leftBarButtonItem = backButton
    navigationController?.navigationBar.prefersLargeTitles = false
    view.addSubview(collectionView)
    
    layout()
  }
  
  private func layout() {
    makeCollectionViewConstraints()
  }

  private func makeCollectionViewConstraints() {
    collectionView.snp.makeConstraints {
      $0.top.left.equalToSuperview().offset(UI.defaultPadding)
      $0.bottom.right.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
}
