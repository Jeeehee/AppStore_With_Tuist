//
//  AppRootInteractor.swift
//  Application
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs
import RxSwift

protocol AppRootPresentable: Presentable {
  var listener: AppRootPresentableListener? { get set }
}

final class AppRootInteractor: PresentableInteractor<AppRootPresentable>, AppRootInteractable, AppRootPresentableListener {
  
  weak var router: AppRootRouting?
  weak var listener: AppRootListener?
  
  override init(presenter: AppRootPresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
  }
  
  override func willResignActive() {
    super.willResignActive()
  }
}
