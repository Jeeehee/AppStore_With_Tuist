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
  let artworkUrl100: String
  /// 스크린샷
  let screenshotUrls: [String]
  /// TrackID
  let trackId: Int
  /// 앱 카테고리
  let genres: [String]
  /// 유저 평가 수
  let userRatingCount: Int
  /// 별점
  let averageUserRating: Double
  
  public init(
    artworkUrl100: String,
    screenshotUrls: [String],
    trackId: Int,
    genres: [String],
    userRatingCount: Int,
    averageUserRating: Double
  ) {
    self.artworkUrl100 = artworkUrl100
    self.screenshotUrls = screenshotUrls
    self.trackId = trackId
    self.genres = genres
    self.userRatingCount = userRatingCount
    self.averageUserRating = averageUserRating
  }
}
