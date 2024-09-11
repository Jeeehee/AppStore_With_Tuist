//
//  AppInfoSummary.swift
//  Entities
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public struct AppInfoSummary: Codable, Equatable {
  /// 앱아이콘
  public let artworkUrl100: String
  /// 앱이름
  public let trackName: String
  /// 스크린샷
  public let screenshotUrls: [String]
  /// TrackID
  public let trackId: Int
  /// 앱 카테고리
  public let genres: [String]
  /// 유저 평가 수
  public let userRatingCount: Int
  /// 별점
  public let averageUserRating: Double
  /// 앱 공유 URL
  public let trackViewUrl: String
  
  public init(
    artworkUrl100: String,
    trackName: String,
    screenshotUrls: [String],
    trackId: Int,
    genres: [String],
    userRatingCount: Int,
    averageUserRating: Double,
    trackViewUrl: String
  ) {
    self.artworkUrl100 = artworkUrl100
    self.trackName = trackName
    self.screenshotUrls = screenshotUrls
    self.trackId = trackId
    self.genres = genres
    self.userRatingCount = userRatingCount
    self.averageUserRating = averageUserRating
    self.trackViewUrl = trackViewUrl
  }
}

public extension AppInfoSummary {
  static let mock = AppInfoSummary.init(
    artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/94/d1/ed/94d1ed2d-6053-e31f-6a46-3c109cc8445c/AppIcon_real-0-0-1x_U007ephone-0-0-85-220.png/100x100bb.jpg",
    trackName: "카카오뱅크",
    screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/6f/b8/d0/6fb8d0c0-df10-436a-949e-bf504277a1eb/6e511b0d-a668-4e02-a829-a9effd325d93_ios_5.5_01.png/392x696bb.png",
                     "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/58/9d/5a/589d5a31-acca-22f8-68af-65ff722ceeca/64b06241-20db-414f-b368-05ba25a37075_ios_5.5_02.png/392x696bb.png",
                     "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/f2/a9/58/f2a958d9-d4bf-3a9b-31d3-23214041c3e9/4295eb77-425e-448d-bb32-9a303d2b4d27_ios_5.5_03.png/392x696bb.png",
                     "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/15/30/5a/15305a39-1007-abcc-f577-8c28785fe886/ee380b0f-9e87-40c8-8e5d-20c1e032533d_ios_5.5_04.png/392x696bb.png",
                     "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/12/6c/78/126c785d-d4f9-5ba4-5366-02a1f3e83f44/1ed2fed1-bcf9-4ab3-b711-36b7e54f8f6e_ios_5.5_05.png/392x696bb.png",
                     "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/6b/89/00/6b8900e5-0d2d-2110-9a81-18585daf3178/ed7b03fa-7c43-4139-9b1b-235134a7d7d7_ios_5.5_06.png/392x696bb.png",
                     "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/aa/5d/0b/aa5d0bb9-e1b1-7102-cf77-b54a1d9c06ce/a5313411-11c9-45d2-9f92-58841d8a0ef5_ios_5.5_07.png/392x696bb.png"],
    trackId: 1258016944,
    genres: ["금융"],
    userRatingCount: 200000,
    averageUserRating: 5,
    trackViewUrl:
      "https://apps.apple.com/kr/app/%EC%B9%B4%EC%B9%B4%EC%98%A4%EB%B1%85%ED%81%AC/id1258016944?uo=4"
    )
}
