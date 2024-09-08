//
//  Application.swift
//  AppFoundation
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit.UIApplication

public protocol ApplicationShared {
  func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?)
}

extension UIApplication: ApplicationShared {}
