//
//  Reactive+.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import UIKit

import RxSwift
import RxCocoa
import RxGesture

public extension ObservableType {
  func preventDuplication(milliseconds: Int = 300) -> Observable<Element> {
    asObservable().throttle(.milliseconds(milliseconds),
                            latest: false,
                            scheduler: MainScheduler.asyncInstance)
  }
}

public extension ObservableType {
  static func create<Object: AnyObject>(with obj: Object, _ subscribe: @escaping (Object, AnyObserver<Element>) -> Disposable) -> Observable<(Element)> {
    return Observable.create { [weak obj] observer in
      guard let obj else { return Disposables.create() }
      
      return subscribe(obj, observer)
    }
  }
}

public extension Reactive where Base: RxGestureView {
  func tapGestureWithPreventDuplication(dueTime: Int = 300) -> Observable<UITapGestureRecognizer> {
    tapGesture().when(.recognized).preventDuplication(milliseconds: dueTime)
  }
}

public extension Reactive where Base: UIButton {
  func tapWithPreventDuplication(dueTime: Int = 300) -> Observable<Void> {
    tap.preventDuplication(milliseconds: dueTime)
  }
}

public extension Single {
  static func create<Object: AnyObject>(with obj: Object, _ subscribe: @escaping ( (Object, SingleObserver)) -> Disposable) -> Single<Element> {
    return Single<Element>.create { [weak obj] observer in
      guard let obj else { return Disposables.create() }
      
      return subscribe((obj, observer))
    }
  }
}
