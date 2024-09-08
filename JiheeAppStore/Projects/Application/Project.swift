//
//  Project.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeApp(
  infoPlist: .file(path: "Attributes/Info.plist"),
  resources: ["Resources/**"],
  hasTests: true
)
