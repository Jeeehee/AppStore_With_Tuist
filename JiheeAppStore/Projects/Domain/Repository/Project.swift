//
//  Project.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/9/24.
//

import Foundation

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
  name: Modules.Domain(.Repository).name,
  product: .framework,
  dependencies: [
    .SPM.RxSwift.dependency,
    .SPM.RxCocoa.dependency,
    .Module.type(.Domain(.Entities)).dependency,
  ],
  hasTests: false
)
