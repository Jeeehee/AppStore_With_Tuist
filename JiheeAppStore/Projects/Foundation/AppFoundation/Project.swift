//
//  Project.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
  name: Modules.Foundation(.AppFoundation).name,
  product: .framework,
  dependencies: [
    .SPM.RIBs.dependency,
    .SPM.RxSwift.dependency,
    .SPM.RxCocoa.dependency,
    .SPM.RxGesture.dependency,
    .SPM.SnapKit.dependency
  ],
  hasTests: false
)
