//
//  Source.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import Foundation

public struct SearchResult: Decodable, Equatable {
  public let resultCount: Int
  public let results: [AppInfo]
}

public struct AppInfo: Decodable, Equatable {
  let screenshotUrls: [String]
  let artworkUrl60, artworkUrl512, artworkUrl100: String
  let supportedDevices: [String]
  let features: [String]
  let kind: String
  let averageUserRating: Double
  let formattedPrice, minimumOSVersion, trackCensoredName: String
  let contentAdvisoryRating: String
  let currentVersionReleaseDate: String
  let releaseNotes: String?
  let resultDescription: String
  let releaseDate: String
  let bundleID: String
  let trackName: String
  let artistID: Int
  let artistName: String
  let price: Int
  let version, wrapperType: String
  let userRatingCount: Int
  
  enum CodingKeys: String, CodingKey {
    case screenshotUrls, artworkUrl60, artworkUrl512, artworkUrl100
    case supportedDevices, features, kind, averageUserRating, formattedPrice
    case minimumOSVersion = "minimumOsVersion"
    case trackCensoredName, contentAdvisoryRating
    case currentVersionReleaseDate, releaseNotes
    case resultDescription = "description"
    case releaseDate
    case bundleID = "bundleId"
    case trackName
    case artistID = "artistId"
    case artistName, price, version, wrapperType, userRatingCount
  }
}
