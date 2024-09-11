//
//  AppSearchModelStream.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RxSwift
import RxRelay

import AppFoundation

public final class AppSearchModelStream {
  
  // MARK: - Properties
  
  public var appInfoSummaryStream: Observable<[AppInfoSummary]> { appInfoSummaryRelay.asObservable() }
  public var appInfoDetailStream: Observable<[AppInfoDetail]> { appInfoDetailRelay.asObservable() }
  public var selectedAppStream: Observable<Int> { selectedAppRelay.asObservable() }
  
  private let appInfoSummaryRelay = BehaviorRelay<[AppInfoSummary]>(value: [])
  private let appInfoDetailRelay = BehaviorRelay<[AppInfoDetail]>(value: [])
  public let selectedAppRelay = BehaviorRelay<Int>(value: .zero)
  
  // MARK: - Update
  
  public func updateAppInfoSummary(with infomations: [AppInfoSummary]) {
    appInfoSummaryRelay.accept(infomations)
  }
  
  public func updateAppInfoDetail(with infomations: [AppInfoDetail]) {
    appInfoDetailRelay.accept(infomations)
  }
  
  public func selectedApp(id: Int) {
    selectedAppRelay.accept(id)
  }
  
  public init() {}
}
