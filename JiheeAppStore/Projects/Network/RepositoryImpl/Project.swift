//
//  Project.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/8/24.
//

import Foundation

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
  name: Modules.Network(.RepositoryImpl).name,
  product: .framework,
  dependencies: [
    .SPM.RxSwift.dependency,
    .SPM.RxCocoa.dependency,
    .Module.type(.Foundation(.AppFoundation)).dependency,
    .Module.type(.Network(.Model)).dependency,
    .Module.type(.Network(.Service)).dependency,
    .Module.type(.Network(.Storage)).dependency,
    .Module.type(.Domain(.Entities)).dependency,
    .Module.type(.Domain(.Repository)).dependency
  ]
)
