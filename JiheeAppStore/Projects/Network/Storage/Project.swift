//
//  Project.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/8/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeProject(
  name: Modules.Network(.Storage).name,
  product: .framework,
  dependencies: [
    .SPM.RxSwift.dependency,
    .SPM.RxCocoa.dependency,
    .Module.type(.Foundation(.AppFoundation)).dependency,
    .Module.type(.Network(.Model)).dependency,
    .Module.type(.Domain(.Entities)).dependency
  ],
  coreDataModels: [.coreDataModel(Path.relativeToRoot("Projects/Network/Storage/Sources/Model.xcdatamodeld"))]
)
