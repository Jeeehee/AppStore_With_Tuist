//
//  Project.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
  name: Modules.Foundation(.Logger).name,
  product: .framework,
  dependencies: [
    .SPM.RxSwift.dependency
  ],
  hasTests: false
)
