//
//  PrintLog.swift
//  LoggerManifests
//
//  Created by Jihee hwang on 9/8/24.
//

import OSLog

// MARK: - 메시지 출력 함수

extension OSLog {
  
  public static func debug(_ message: String) {
    printLog(logType: .debug, message: message)
  }
  
  public static func info(_ message: String) {
    printLog(logType: .debug, message: message)
  }
  
  public static func error(_ message: String) {
    printLog(logType: .error, message: message)
  }
  
  public static func notice_Default(_ message: String) {
    printLog(logType: .default, message: message)
  }
  
  private static func printLog(logType: OSLogType, message: String) {
    os_log("%s", log: .default, type: logType, message)
  }
  
}
