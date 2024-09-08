//
//  Workspace.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let workspace: Workspace = .init(
    name: Constants.projectName,
    projects: [
        "Projects/Application",
        "Projects/Features/**",
        "Projects/Domain/**",
        "Projects/Network/**",
        "Projects/Foundation/**"
    ]
)
