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
  /// 앱 공유 URL
  public let trackViewUrl: String
  /// 연령
  public let contentAdvisoryRating: String
  /// 회사
  public let sellerName: String
  /// 언어
  public let languageCodesISO2A: [String]
  /// 릴리즈노트
  public let releaseNotes: String
  
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

public extension AppInfoDetail {
  static let mock = AppInfoDetail.init(
    appInfoSummary: AppInfoSummary.mock,
    trackViewUrl:
      "https://apps.apple.com/kr/app/%EC%B9%B4%EC%B9%B4%EC%98%A4%EB%B1%85%ED%81%AC/id1258016944?uo=4",
    contentAdvisoryRating:
      "4+",
    sellerName: "kakaobank",
    languageCodesISO2A: ["KO"],
    releaseNotes: "● 새로운 기능을 추가하고 사용성을 개선했어요.\n- 카메라 버튼을 눌러 계좌번호를 사진으로 찍어 빠르게 이체해보세요.\n- 보유 중인 카카오뱅크 대출도 \'신용대출 갈아타기\'에서 원하는 조건으로 갈아타보세요. \n- 더욱 편리한 서비스 제공을 위해 기능 개선 및 불편점 해소 작업도 함께 진행했어요."
  )
}
