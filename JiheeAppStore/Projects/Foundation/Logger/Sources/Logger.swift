//
//  Logger.swift
//  Logger
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import OSLog

public class Logger {
  
  public static func debug(_ message: String) {
    printLog(log: .debug, logType: .debug, message: message)
  }
  
  public static func info(_ message: String) {
    printLog(log: .info, logType: .info, message: message)
  }
  
  public static func error(_ message: String) {
    printLog(log: .error, logType: .error, message: message)
  }
  
  public static func notice_Default(_ message: String) {
    printLog(log: .default, logType: .default, message: message)
  }
  
  public static func network(_ message: String) {
    printLog(log: .network, logType: .debug, message: message)
  }
  
  public static func ui(_ message: String) {
    printLog(log: .ui, logType: .debug, message: message)
  }
  
  public static func printLog(log: OSLog, logType: OSLogType, message: String) {
    #if DEBUG
    os_log("%s", log: log, type: logType, message)
    #endif
  }
  
}
