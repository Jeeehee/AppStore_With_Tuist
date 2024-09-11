//
//  AppInfoDetail.swift
//  Entities
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public struct AppInfoDetail: Codable, Equatable {
  /// 앱 요약 정보
  public let appInfoSummary: AppInfoSummary
  /// 연령
  public let contentAdvisoryRating: String
  /// 회사
  public let sellerName: String
  /// 언어
  public let languageCodesISO2A: [String]
  
  public init(
    appInfoSummary: AppInfoSummary,
    contentAdvisoryRating: String,
    sellerName: String,
    languageCodesISO2A: [String]
  ) {
    self.appInfoSummary = appInfoSummary
    self.contentAdvisoryRating = contentAdvisoryRating
    self.sellerName = sellerName
    self.languageCodesISO2A = languageCodesISO2A
  }
  
}

public extension AppInfoDetail {
  static let mock = AppInfoDetail.init(
    appInfoSummary: AppInfoSummary.mock,
    contentAdvisoryRating:
      "4+",
    sellerName: "kakaobank",
    languageCodesISO2A: ["KO"]
  )
}
