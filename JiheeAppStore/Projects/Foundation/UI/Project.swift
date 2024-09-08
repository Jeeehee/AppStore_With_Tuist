//
//  Project.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
  name: Modules.Foundation(.UI).name,
  product: .framework,
  dependencies: [
    .SPM.SnapKit.dependency,
    .SPM.RxSwift.dependency,
    .SPM.RxCocoa.dependency,
  ],
  hasTests: true
)
