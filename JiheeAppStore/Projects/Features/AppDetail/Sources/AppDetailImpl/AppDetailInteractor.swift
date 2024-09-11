//
//  AppDetailInteractor.swift
//  AppDetail
//
//  Created by Jihee hwang on 9/11/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs
import RxSwift

import Entities

protocol AppDetailPresentable: Presentable {
  var listener: AppDetailPresentableListener? { get set }
  func bindAppInfoDetail(_ informations: AppInfoDetail)
}

final class AppDetailInteractor: PresentableInteractor<AppDetailPresentable>, AppDetailInteractable, AppDetailPresentableListener {
  
  weak var router: AppDetailRouting?
  weak var listener: AppDetailListener?
  
  private let appSearchModelStream: AppSearchModelStream
  
  init(
    presenter: AppDetailPresentable,
    appSearchModelStream: AppSearchModelStream
  ) {
    self.appSearchModelStream = appSearchModelStream
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
  }
  
  override func willResignActive() {
    super.willResignActive()
  }
  
  func loadData() {
    appSearchModelStream
      .appInfoDetailStream
      .observe(on: MainScheduler.asyncInstance)
      .subscribe(with: self) { owner, appInfoDetail in
        let selectedAppID = owner.appSearchModelStream.selectedAppRelay.value
        guard let selectedItem = appInfoDetail
          .filter({ $0.appInfoSummary.trackId == selectedAppID }).first else {
          return
        }
        owner.presenter.bindAppInfoDetail(selectedItem)
      }
      .disposeOnDeactivate(interactor: self)
  }
  
  func didTapBackButton() {
    listener?.detachAppDetailRIB()
  }
  
}
