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
  name: Modules.Domain(.UsecaseImpl).name,
  product: .framework,
  dependencies: [
    .SPM.RxSwift.dependency,
    .SPM.RxCocoa.dependency,
    .Module.type(.Domain(.Entities)).dependency,
    .Module.type(.Domain(.Usecase)).dependency,
    .Module.type(.Domain(.Repository)).dependency,
    .Module.type(.Network(.Model)).dependency,
    .Module.type(.Network(.Service)).dependency
  ]
)
