//
//  AppRootViewController.swift
//  Application
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol AppRootPresentableListener: AnyObject {
  
}

final class AppRootViewController: UIViewController, AppRootPresentable, AppRootViewControllable {
  
  weak var listener: AppRootPresentableListener?
}
