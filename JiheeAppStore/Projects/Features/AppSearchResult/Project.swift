//
//  Project.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/9/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
  name: Modules.Features(.AppSearchResult).name,
  product: .framework,
  dependencies: [
    .SPM.RIBs.dependency,
    .SPM.RxSwift.dependency,
    .SPM.RxCocoa.dependency,
    .SPM.RxRelay.dependency,
    .SPM.RxGesture.dependency,
    .SPM.SnapKit.dependency,
    .Module.type(.Domain(.Entities)).dependency,
    .Module.type(.Domain(.Usecase)).dependency,
    .Module.type(.Foundation(.AppFoundation)).dependency,
    .Module.type(.Foundation(.Logger)).dependency,
    .Module.type(.Foundation(.UI)).dependency,
  ],
  hasTests: false
)
