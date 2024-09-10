//
//  SearchBarViewController.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

import UI
import AppFoundation

protocol SearchBarPresentableListener: AnyObject {
  func didTapSearchButtonClicked(_ keyword: String)
  func searchKeyword(_ keyword: String)
}

final class SearchBarViewController:
  BaseViewController,
  SearchBarPresentable,
  SearchBarViewControllable,
  KeyboardAddable
{
  // MARK: - Properties
  
  weak var listener: SearchBarPresentableListener?
//  
//  private var searchBarDelegate: SearchBarDelegate? // 사용할거면 주석 풀기
  
  // MARK: - UI
  
  private enum UI {
    static let title = "어떤 앱을 찾으시나요?"
    static let searchBarPlaceholder = "게임, 앱, 스토리 등"
  }
  
  // 사용할거면 주석 풀기
  //  private let titleLabel = UILabel()
  //    .builder
  //    .with {
  //      $0.text = UI.title
  //      $0.font = .title
  //    }
  //    .build()
  //
  //  private let searchBar = UISearchBar()
  //    .builder
  //    .with {
  //      $0.layer.masksToBounds = true
  //      $0.layer.cornerRadius = 25
  //      $0.backgroundColor = .white
  //      $0.searchTextField.backgroundColor = .white
  //      $0.placeholder = UI.searchBarPlaceholder
  //    }
  //    .build()
  
  private let searchController = UISearchController()
    .builder
    .with {
      $0.searchBar.placeholder = UI.searchBarPlaceholder
      $0.obscuresBackgroundDuringPresentation = false
      $0.hidesNavigationBarDuringPresentation = false
    }
    .build()
  
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

// MARK: - Bind

extension SearchBarViewController {
  private func bindActions() {
    bindDidTapSearchButton()
    bindChangeSearchKeyword()
  }

  private func bindDidTapSearchButton() {
    searchController.searchBar.rx.searchButtonClicked
      .preventDuplication()
      .asDriver(onErrorDriveWith: .empty())
      .drive(with: self) { owner, _ in owner.listener?.didTapSearchButtonClicked(owner.searchController.searchBar.text ?? "") }
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

// MARK: - ConfigureUI

extension SearchBarViewController {
  
  private func setupUI() {
    //    view.addSubview(titleLabel) // 사용할거면 주석 풀기
    //    view.addSubview(searchBar) // 사용할거면 주석 풀기
    //    searchBar.delegate = searchBarDelegate // 사용할거면 주석 풀기
//    view.addSubview(contentView)
    
    setupView()
    layout()
  }
  
  private func setupView() {
    title = UI.title
    navigationController?.navigationBar.isHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.searchController = searchController
  }
  
  private func layout() {
    //    makeTitleLabelContainerViewConstraints() // 사용할거면 주석 풀기
    //    makeSearchBarContainerViewConstraints() // 사용할거면 주석 풀기
  }

  
  // 사용할거면 주석 풀기
  //  private func makeTitleLabelContainerViewConstraints() {
  //    titleLabel.snp.makeConstraints {
  //      $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
  //      $0.leading.equalToSuperview().inset(20)
  //    }
  //  }
  //
  //  private func makeSearchBarContainerViewConstraints() {
  //    searchBar.snp.makeConstraints {
  //      $0.top.equalTo(titleLabel.snp.bottom).offset(20)
  //      $0.width.equalToSuperview().inset(20)
  //      $0.height.equalTo(50)
  //      $0.centerX.bottom.equalToSuperview()
  //    }
  //  }
  
}

// MARK: - UISearchBarDelegate

final class SearchBarDelegate: NSObject, UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.placeholder = ""
  }
}
