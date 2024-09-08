//
//  Reactive+Log.swift
//  Logger
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import OSLog

import RxSwift

public extension ObservableType {
  func logErrorIfDetected(log: OSLog, type: OSLogType = .error) -> Observable<Element> {
    self.do(onError: { error in
      let errorMessage = error.localizedDescription
      Logger.printLog(log: log, logType: type, message: errorMessage)
    })
  }
}

public extension PrimitiveSequence where Trait == SingleTrait {
  func logErrorIfDetected(log: OSLog, type: OSLogType = .error) -> Single<Element> {
    asObservable()
      .logErrorIfDetected(log: log, type: type)
      .asSingle()
  }
}

public extension PrimitiveSequence where Trait == CompletableTrait, Element == Never {
  func logErrorIfDetected(log: OSLog,  type: OSLogType = .error) -> Completable {
    asObservable()
      .logErrorIfDetected(log: log, type: type)
      .asCompletable()
  }
}
