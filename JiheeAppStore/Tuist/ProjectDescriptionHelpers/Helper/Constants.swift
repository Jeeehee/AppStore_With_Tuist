//
//  Constants.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription

public enum Constants {
  public static let projectName: String = "JiheeAppStore"
  public static let organizationName: String = "Jihee"
  public static let bundleID: String = "com.JiheeAppStore"
  public static let deploymentTarget: DeploymentTargets = .iOS("15.0")
  
  static let baseSettings: SettingsDictionary = [
    "CODE_SIGN_IDENTITY": "",
    "CODE_SIGNING_REQUIRED": "NO",
  ]
}
