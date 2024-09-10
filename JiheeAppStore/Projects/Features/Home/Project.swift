//
//  Project.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
  name: Modules.Features(.Home).name,
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
    .Module.type(.Network(.Model)).dependency,
    .Module.type(.Network(.Service)).dependency,
    .Module.type(.Foundation(.AppFoundation)).dependency,
    .Module.type(.Foundation(.Logger)).dependency,
    .Module.type(.Foundation(.UI)).dependency,
  ],
  hasTests: false
)
