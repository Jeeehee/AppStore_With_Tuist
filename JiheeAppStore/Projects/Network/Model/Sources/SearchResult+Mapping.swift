//
//  SearchResult+Mapping.swift
//  Model
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import Entities

public extension AppInfo {
  func toAppInfoSummary() -> AppInfoSummary {
    .init(
      artworkUrl100: artworkUrl100,
      screenshotUrls: screenshotUrls,
      trackId: trackID,
      genres: genres,
      userRatingCount: userRatingCount,
      averageUserRating: averageUserRating
    )
  }
  
  func toAppInfoDetail() -> AppInfoDetail {
    .init(
      appInfoSummary: toAppInfoSummary(),
      trackViewUrl: trackViewURL,
      contentAdvisoryRating: contentAdvisoryRating,
      sellerName: sellerName,
      languageCodesISO2A: languageCodesISO2A,
      releaseNotes: releaseNotes)
  }
}
