//
//  RecentSearchHistoryViewController.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import RIBs
import RxSwift
import RxCocoa

import UI
import AppFoundation
import Entities

protocol RecentSearchHistoryPresentableListener: AnyObject {
  func loadData()
}

final class RecentSearchHistoryViewController:
  BaseViewController,
  RecentSearchHistoryPresentable,
  RecentSearchHistoryViewControllable
{
  // MARK: - Properties
  
  weak var listener: RecentSearchHistoryPresentableListener?
  
  private let collectionViewLayout = CollectionViewLeftAlignFlowLayout()
//    .builder
//    .with {
//      $0.scrollDirection = .vertical
//      $0.minimumLineSpacing = 10
//      $0.minimumInteritemSpacing = 10
//      $0.sectionInset = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)
//      $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//
//    }
//    .build()
//  
  // MARK: - UI
  
  private enum UI {
    static let title = "최근 검색어"
    static let defaultPadding = 20.0
  }
  
  private let historyTitleLabel = UILabel()
    .builder
    .with {
      $0.text = UI.title
      $0.font = .body_Medium
    }
    .build()
  
  private lazy var recentKeywordCollectionView = UICollectionView(
    frame: CGRect.zero,
    collectionViewLayout: collectionViewLayout)
    .builder
    .with {
      $0.backgroundColor = .clear
      RecentKeywordCollectionViewCell.register($0)
    }
    .build()
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    
    bindLoadData()
  }
}

// MARK: - Bind Action

extension RecentSearchHistoryViewController {
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

extension RecentSearchHistoryViewController {
  func bindRecentSearchHistory(_ history: [SearchHistory]) {
    Observable.of(history)
      .asDriver(onErrorDriveWith: .empty())
      .drive(recentKeywordCollectionView.rx.items(
        cellIdentifier: RecentKeywordCollectionViewCell.identifier,
        cellType: RecentKeywordCollectionViewCell.self)) { index, item, cell in
          cell.fetchData(recentKeyword: item.keyword)
        }
        .disposed(by: disposeBag)
  }
}

// MARK: - ConfigureUI

extension RecentSearchHistoryViewController {
  
  private func setupUI() {
    view.addSubviews(historyTitleLabel, recentKeywordCollectionView)
    
    layout()
  }
  
  private func layout() {
    makeTitleLabelContainerViewConstraints()
    makeRecentKeywordCollectionViewConstraints()
  }
  
  private func makeTitleLabelContainerViewConstraints() {
    historyTitleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UI.defaultPadding)
      $0.left.equalToSuperview().offset(UI.defaultPadding)
    }
  }
  
  private func makeRecentKeywordCollectionViewConstraints() {
    recentKeywordCollectionView.snp.makeConstraints {
      $0.top.equalTo(historyTitleLabel.snp.bottom).offset(UI.defaultPadding)
      $0.left.equalToSuperview().offset(UI.defaultPadding)
      $0.bottom.right.equalTo(view.safeAreaLayoutGuide).offset(-UI.defaultPadding)
    }
  }
}
