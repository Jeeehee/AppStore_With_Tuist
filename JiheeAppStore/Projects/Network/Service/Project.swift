//
//  Project.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/8/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
  name: Modules.Network(.Service).name,
  product: .framework,
  dependencies: [
    .SPM.RxSwift.dependency,
    .Module.type(.Foundation(.AppFoundation)).dependency,
    .Module.type(.Network(.Model)).dependency
  ]
)
