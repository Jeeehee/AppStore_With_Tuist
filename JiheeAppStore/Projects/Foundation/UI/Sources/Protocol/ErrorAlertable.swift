//
//  ErrorAlertable.swift
//  UI
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

public protocol ErrorAlertable {
  func showErrorAlert(with message: ErrorMessage)
  func makeErrorAlert(with message: ErrorMessage) -> UIAlertController
}

extension ErrorAlertable where Self: UIViewController {
  public func showErrorAlert(with message: ErrorMessage) {
    let alert = makeErrorAlert(with: message)
    present(alert, animated: true)
  }
  
  public func makeErrorAlert(with message: ErrorMessage) -> UIAlertController {
    let alert = UIAlertController(
      title: message.title,
      message: message.message,
      preferredStyle: .alert
    )
    
    let confirmAction = UIAlertAction(title: message.confirmActionTitle, style: .cancel)
    alert.addAction(confirmAction)
    
    return alert
  }
}
