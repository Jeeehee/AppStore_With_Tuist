//
//  Constant.swift
//  AppFoundation
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

public enum Layout {
  public static let safeAreaTopHeight = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets.top ?? .zero
  public static let safeAreaBottomHeight = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets.bottom ?? .zero
}
