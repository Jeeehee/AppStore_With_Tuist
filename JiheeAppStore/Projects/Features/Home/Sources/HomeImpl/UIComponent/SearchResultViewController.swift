//
//  SearchResultViewController.swift
//  Home
//
//  Created by Jihee hwang on 9/10/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

import UI
import AppFoundation
import Entities

protocol SearchResultListener: AnyObject {
  func didTapApp(_ item: AppInfoSummary)
}

final class SearchViewController:
  BaseViewController,
  KeyboardAddable
{
  
  weak var listener: SearchResultListener?
  
  // MARK: - UI
  
  private let keywordFilterTableView = UITableView()
    .builder
    .with {
      $0.keyboardDismissMode = .onDrag
      $0.separatorStyle = .none
      KeywordFilterTableView.register($0)
    }
    .build()
  
  private lazy var searchResultCollectionView = UICollectionView(
    frame: CGRect.zero,
    collectionViewLayout: UICollectionViewFlowLayout())
    .builder
    .with {
      $0.backgroundColor = .white
      $0.delegate = self
      AppInfoSummaryCollectionViewCell.register($0)
    }
    .build()
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()

    addKeyboardObserver()
    setupUI()
    bind()
  }
  
  deinit {
    removeKeyboardObserver()
  }
  
  func fetchHistory(_ history: [SearchHistory]) {
    Observable.of(history)
      .asDriver(onErrorDriveWith: .empty())
      .drive(keywordFilterTableView.rx.items(
        cellIdentifier: KeywordFilterTableView.identifier,
        cellType: KeywordFilterTableView.self)) { indexPath, item, cell in
          cell.fetchData(recentKeyword: item.keyword)
        }
        .disposed(by: disposeBag)
    
    keywordFilterTableView.isHidden = false
    searchResultCollectionView.isHidden = true
  }
  
  func fetchAppInfoSummary(_ informations: [AppInfoSummary]) {
    Observable.of(informations)
      .observe(on: MainScheduler.instance)
      .asDriver(onErrorDriveWith: .empty())
      .drive(searchResultCollectionView.rx.items(
        cellIdentifier: AppInfoSummaryCollectionViewCell.identifier,
        cellType: AppInfoSummaryCollectionViewCell.self)) { index, item, cell in
          cell.fetchAppInfoSummary(item)
        }
        .disposed(by: disposeBag)
    
    keywordFilterTableView.isHidden = true
    searchResultCollectionView.isHidden = false
  }
  
  private func bind() {
    searchResultCollectionView
      .rx
      .modelSelected(AppInfoSummary.self)
      .bind(with: self, onNext: { owner, item in
        owner.listener?.didTapApp(item)
      })
      .disposed(by: disposeBag)
  }
}

// MARK: - ConfigureUI

extension SearchViewController {
  
  private func setupUI() {
    view.addSubview(keywordFilterTableView)
    view.addSubview(searchResultCollectionView)
    navigationController?.navigationBar.backgroundColor = .red
    layout()
  }
  
  private func layout() {
    keywordFilterTableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
    
    searchResultCollectionView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 2.5)
  }
}
