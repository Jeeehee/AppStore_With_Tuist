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
  let artworkUrl512: String
  let screenshotUrls: [String]
  let ipadScreenshotUrls, appletvScreenshotUrls: [String]
  let isGameCenterEnabled: Bool
  let supportedDevices: [String]
  let advisories, features: [String]
  let artistViewURL: String
  let artworkUrl60, artworkUrl100: String
  let kind, minimumOSVersion: String
  let averageUserRatingForCurrentVersion: Double
  let languageCodesISO2A: [String]
  let fileSizeBytes: String
  let formattedPrice: String
  let userRatingCountForCurrentVersion: Int
  let trackContentRating: String
  let currentVersionReleaseDate: String
  let releaseNotes, artistName: String
  let genres: [String]
  let price: Int
  let description: String
  let genreIDS: [String]
  let primaryGenreName: String
  let primaryGenreID: Int
  let bundleID, sellerName: String
  let trackID: Int
  let trackName, currency: String
  let isVppDeviceBasedLicensingEnabled: Bool
  let releaseDate: String
  let averageUserRating: Double
  let trackCensoredName: String
  let trackViewURL: String
  let contentAdvisoryRating: String
  let artistID: Int
  let version, wrapperType: String
  let userRatingCount: Int
  
  enum CodingKeys: String, CodingKey {
    case artworkUrl512, screenshotUrls, ipadScreenshotUrls, appletvScreenshotUrls, isGameCenterEnabled, supportedDevices, advisories, features
    case artistViewURL = "artistViewUrl"
    case artworkUrl60, artworkUrl100, kind
    case minimumOSVersion = "minimumOsVersion"
    case averageUserRatingForCurrentVersion, languageCodesISO2A, fileSizeBytes
    case formattedPrice, userRatingCountForCurrentVersion, trackContentRating, currentVersionReleaseDate, releaseNotes, artistName, genres, price, description
    case genreIDS = "genreIds"
    case primaryGenreName
    case primaryGenreID = "primaryGenreId"
    case bundleID = "bundleId"
    case sellerName
    case trackID = "trackId"
    case trackName, currency, isVppDeviceBasedLicensingEnabled, releaseDate, averageUserRating, trackCensoredName
    case trackViewURL = "trackViewUrl"
    case contentAdvisoryRating
    case artistID = "artistId"
    case version, wrapperType, userRatingCount
  }
}
