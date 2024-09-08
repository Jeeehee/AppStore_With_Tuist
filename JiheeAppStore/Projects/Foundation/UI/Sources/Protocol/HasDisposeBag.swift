//
//  HasDisposeBag.swift
//  UI
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RxSwift

public protocol HasDisposeBag {
  var disposeBag: DisposeBag { get set }
}

