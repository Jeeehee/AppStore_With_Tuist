//
//  OSLog+.swift
//  LoggerManifests
//
//  Created by Jihee hwang on 9/8/24.
//

import OSLog

public extension OSLog {
  /// 앱의 서브시스템 정의
  static var subsystem = Bundle.main.bundleIdentifier ?? .init()

  static let debug = OSLog(subsystem: subsystem, category: "Debug")
  static let info = OSLog(subsystem: subsystem, category: "Info")
  static let error = OSLog(subsystem: subsystem, category: "Error")
  static let `default` = OSLog(subsystem: subsystem, category: "Default")
  
  static let network = OSLog(subsystem: subsystem, category: "Network")
  static let ui = OSLog(subsystem: subsystem, category: "UI")
}
