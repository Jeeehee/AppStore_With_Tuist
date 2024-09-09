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
  let appInfoSummary: AppInfoSummary
  /// 앱 공유 URL
  let trackViewUrl: String
  /// 연령
  let contentAdvisoryRating: String
  /// 회사
  let sellerName: String
  /// 언어
  let languageCodesISO2A: [String]
  /// 릴리즈노트
  let releaseNotes: String
  
  public init(
    appInfoSummary: AppInfoSummary,
    trackViewUrl: String,
    contentAdvisoryRating: String,
    sellerName: String,
    languageCodesISO2A: [String],
    releaseNotes: String
  ) {
    self.appInfoSummary = appInfoSummary
    self.trackViewUrl = trackViewUrl
    self.contentAdvisoryRating = contentAdvisoryRating
    self.sellerName = sellerName
    self.languageCodesISO2A = languageCodesISO2A
    self.releaseNotes = releaseNotes
  }
}
