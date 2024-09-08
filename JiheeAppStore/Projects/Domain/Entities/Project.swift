//
//  Project.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
  name: Modules.Domain(.Entities).name,
  product: .framework,
  dependencies: [],
  hasTests: false
)
