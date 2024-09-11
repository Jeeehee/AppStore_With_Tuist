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
import AppSearchResult
import Entities

protocol HomePresentableListener: AnyObject {
  func didTapSearchButtonClicked(_ keyword: String)
  func saveKeyword(_ keyword: String)
  func searchKeyword(_ keyword: String)
  func didTapAppSummary(_ id: Int)
}

final class HomeViewController:
  BaseViewController,
  HomePresentable,
  HomeViewControllable,
  KeyboardAddable
{
  // MARK: - Properties
  
  weak var listener: HomePresentableListener?
  
  // MARK: - UI
  
  private enum UI {
    static let title = "어떤 앱을 찾으시나요?"
    static let searchBarPlaceholder = "게임, 앱, 스토리 등"
  }
  
  private let searchResultViewController = SearchViewController()
  
  private lazy var searchController = UISearchController(searchResultsController: searchResultViewController)
    .builder
    .with {
      $0.searchBar.placeholder = UI.searchBarPlaceholder
      $0.obscuresBackgroundDuringPresentation = false
    }
    .build()
  
  private let recentSearchHistoryContainerView = UIView()
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addKeyboardObserver()
    setupUI()
    bindActions()
  }
  
  deinit {
    removeKeyboardObserver()
  }
}


// MARK: - Bind Action

extension HomeViewController {
  private func bindActions() {
    bindstartSearch()
    bindDidTapSearchButton()
    bindChangeSearchKeyword()
  }
  
  private func bindstartSearch() {
    searchController.searchBar.rx.textDidBeginEditing
      .asDriver(onErrorDriveWith: .empty())
      .drive(with: self) { owner, _ in
        owner.searchController.becomeFirstResponder()
      }
      .disposed(by: disposeBag)
  }
  
  private func bindDidTapSearchButton() {
    searchController.searchBar.rx.searchButtonClicked
      .preventDuplication()
      .asDriver(onErrorDriveWith: .empty())
      .drive(with: self) { owner, _ in
        owner.searchController.resignFirstResponder()
        
        let keyword = owner.searchController.searchBar.text ?? ""
        owner.listener?.didTapSearchButtonClicked(keyword)
        owner.listener?.saveKeyword(keyword)
      }
      .disposed(by: disposeBag)
  }
  
  private func bindChangeSearchKeyword() {
    searchController.searchBar.rx.text.orEmpty
      .distinctUntilChanged()
      .asDriver(onErrorDriveWith: .empty())
      .drive(with: self) { owner, text in owner.listener?.searchKeyword(text) }
      .disposed(by: disposeBag)
  }
}

// MARK: - Bind State

extension HomeViewController {
  func bindRecentSearchHistory(_ history: [SearchHistory]) {
    searchResultViewController.fetchHistory(history)
  }
  
  func bindAppInfoSummary(_ informations: [AppInfoSummary]) {
    searchResultViewController.fetchAppInfoSummary(informations)
  }
}

// MARK: - ConfigureUI

extension HomeViewController {
  
  private func setupUI() {
    view.addSubview(recentSearchHistoryContainerView)
    
    setupView()
    layout()
  }
  
  private func setupView() {
    title = UI.title
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.hidesSearchBarWhenScrolling = true
    navigationItem.searchController = searchController
    searchResultViewController.listener = self
  }
  
  private func layout() {
    makeRecentHistoryContainerViewConstraints()
  }
  
  private func makeRecentHistoryContainerViewConstraints() {
    recentSearchHistoryContainerView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.width.bottom.equalToSuperview()
    }
  }
  
}

extension HomeViewController: SearchResultListener {
  func didTapApp(_ item: AppInfoSummary) {
    listener?.didTapAppSummary(item.trackId)
  }
}

// MARK: - Add Child View

extension HomeViewController {
  func addRecentSearchHistoryView(_ view: ViewControllable) {
    addChildViewController(container: recentSearchHistoryContainerView, child: view)
  }
}
