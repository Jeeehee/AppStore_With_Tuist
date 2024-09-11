//
//  BaseViewController.swift
//  UI
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import RxSwift
import SnapKit

import Logger

open class BaseViewController:
  UIViewController,
  HasDisposeBag,
  ErrorAlertable
{
  
  // MARK: - Properties
  
  public var disposeBag: DisposeBag = DisposeBag()
  public var bottomConstraint: Constraint? = nil
  
  // MARK: - Initialization & deinitialization
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  public required convenience init?(coder aDecoder: NSCoder) {
    assertionFailure("init(coder:) has not been implemented")
    self.init()
  }
  
  deinit {
    Logger.debug("Deinit \(self)")
  }
  
  // MARK: - View LifeCycle
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    view.setNeedsUpdateConstraints()
    navigationController?.navigationBar.isHidden = false
    view.backgroundColor = .white
  }
  
  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  open override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    guard isMovingToParent || isBeingDismissed else { return }
  }
  
}

// MARK: - Layout

extension BaseViewController {
  
  open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
}

// MARK: - objc

extension BaseViewController {
  @objc func keyboardWillShow(notification: Notification) {
    let info = notification.userInfo ?? [:]
    guard let kbHeight = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else { return }
    bottomConstraint?.update(offset: -kbHeight)
    animateKeyboard(info: info)
  }
  
  @objc func keyboardWillHide(notification: Notification) {
    let info = notification.userInfo ?? [:]
    bottomConstraint?.update(offset: -32)
    animateKeyboard(info: info)
  }
  
  private func animateKeyboard(info: [AnyHashable: Any]) {
    guard let duration: TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else { return }
    UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
  }
}
