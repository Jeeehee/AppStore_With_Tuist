//
//  ViewController+.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import UIKit

import RIBs

import SnapKit

// MARK: - NavigateViewControllable

public final class NavigationViewControllable: ViewControllable  {
  public var uiviewController: UIViewController { navigationController }
  public let navigationController: UINavigationController
  
  public init(root: ViewControllable) {
    let navigation = UINavigationController(rootViewController: root.uiviewController)
    navigation.navigationBar.backgroundColor = .white
    navigation.navigationBar.tintColor = .darkGray
    
    self.navigationController = navigation
  }
}

// MARK: - Extension ViewControllable

public extension ViewControllable {
  func present(
    _ viewControllable: ViewControllable,
    animated: Bool = true,
    completion: (() -> Void)? = nil
  ) {
    uiviewController.present(viewControllable.uiviewController, animated: animated, completion: completion)
  }
  
  func presentFullScreen(
    _ viewControllable: ViewControllable,
    animated: Bool = false,
    completion: (() -> Void)? = nil
  ) {
    DispatchQueue.main.async { [weak self] in
      viewControllable.uiviewController.modalPresentationStyle = .fullScreen
      self?.uiviewController.present(viewControllable.uiviewController, animated: animated, completion: completion)
    }
  }
  
  func dismiss(
    animated: Bool,
    completion: (() -> Void)?
  ) {
    DispatchQueue.main.async { [weak self] in
      self?.uiviewController.dismiss(animated: animated, completion: completion)
    }
  }
  
  func pushViewController(
    _ viewControllable: ViewControllable,
    animated: Bool = true
  ) {
    guard let navigation = uiviewController as? UINavigationController else {
      uiviewController.navigationController?.pushViewController(viewControllable.uiviewController, animated: animated)
      return
    }
    
    navigation.pushViewController(viewControllable.uiviewController, animated: animated)
  }
  
  func popViewController(
    animated: Bool = false,
    completion: (() -> Void)? = nil
  ) {
    guard let navigation = uiviewController as? UINavigationController else {
      CATransaction.begin()
      CATransaction.setCompletionBlock(completion)
      uiviewController.navigationController?.popViewController(animated: animated)
      CATransaction.commit()
      return
    }
    
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    navigation.popViewController(animated: animated)
    CATransaction.commit()
  }
  
  func popToRoot(animated: Bool) {
    guard let navigation = uiviewController as? UINavigationController else {
      uiviewController.navigationController?.popToRootViewController(animated: animated)
      return
    }
    
    navigation.popToRootViewController(animated: animated)
  }
  
}

// MARK: - Add Child

public extension ViewControllable {
  func addChildViewController(container: UIView, child: ViewControllable) {
    let childViewController = child.uiviewController
    
    uiviewController.addChild(child.uiviewController)
    container.addSubview(childViewController.view)
    
    childViewController.view.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    childViewController.didMove(toParent: self.uiviewController)
  }
}
