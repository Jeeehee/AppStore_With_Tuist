//
//  Project+Templates.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

public extension Project {
  static func makeApp(name: String = "Application",
                      organizationName: String = Constants.organizationName,
                      packages: [Package] = Package.SPM.allPackages,
                      product: Product = .app,
                      platform: Platform = .iOS,
                      deploymentTarget: DeploymentTargets? = Constants.deploymentTarget,
                      dependencies: [TargetDependency] = TargetDependency.Module.allDependencies,
                      infoPlist: InfoPlist = .default,
                      sources: SourceFilesList = ["Sources/**"],
                      resources: ResourceFileElements? = nil,
                      hasTests: Bool = true,
                      hasUITests: Bool = false
  ) -> Project {
    let mainTarget = Target.target(name: name,
                                   destinations: .iOS,
                                   product: product,
                                   bundleId: Constants.bundleID + ".\(name)",
                                   deploymentTargets: Constants.deploymentTarget,
                                   infoPlist: infoPlist,
                                   sources: sources,
                                   resources: resources,
                                   dependencies: dependencies
    )
    
    var targets: [Target] = [mainTarget]
    
    if hasTests { targets.append(makeTestTarget(name: name)) }
    if hasUITests { targets.append(makeUITestTarget(name: name)) }
    
    let schemes: [Scheme] = [.makeScheme(target: .dev, name: name)]
    let settings: Settings =
      .settings(base: Constants.baseSettings,
                configurations: [.debug(name: AppConfiguration.dev.configurationName, xcconfig: XCConfig.xcconfig(.dev)),
                                 .release(name: AppConfiguration.prod.configurationName, xcconfig: XCConfig.xcconfig(.prod))],
                defaultSettings: .recommended)
    
    return Project(name: name,
                   organizationName: Constants.organizationName,
                   packages: packages,
                   settings: settings,
                   targets: targets,
                   schemes: schemes
    )
  }
  
  static func makeProject(name: String,
                          organizationName: String = Constants.organizationName,
                          packages: [Package] = [],
                          product: Product,
                          platform: Platform = .iOS,
                          deploymentTarget: DeploymentTargets? = Constants.deploymentTarget,
                          dependencies: [TargetDependency],
                          infoPlist: InfoPlist = .default,
                          sources: SourceFilesList = ["Sources/**"],
                          resources: ResourceFileElements? = nil,
                          hasTests: Bool = true,
                          hasUITests: Bool = false
  ) -> Project {
    let mainTarget = Target.target(name: name,
                                   destinations: .iOS,
                                   product: product,
                                   bundleId: Constants.bundleID + ".\(name)",
                                   deploymentTargets: Constants.deploymentTarget,
                                   infoPlist: infoPlist,
                                   sources: sources,
                                   resources: resources,
                                   dependencies: dependencies
    )
    
    var targets: [Target] = [mainTarget]
    
    if hasTests { targets.append(makeTestTarget(name: name)) }
    if hasUITests { targets.append(makeUITestTarget(name: name)) }
    
    let schemes: [Scheme] = [.makeScheme(target: .dev, name: name)]
    let settings: Settings =
      .settings(base: Constants.baseSettings,
                configurations: [.debug(name: AppConfiguration.dev.configurationName),
                                 .release(name: AppConfiguration.prod.configurationName)
                ],
                defaultSettings: .recommended)
    
    return Project(name: name,
                   organizationName: Constants.organizationName,
                   packages: packages,
                   settings: settings,
                   targets: targets,
                   schemes: schemes
    )
  }
  
  static func makeTestTarget(name: String) -> Target {
    Target.target(name: "\(name)Tests",
                  destinations: .iOS,
                  product: .unitTests,
                  bundleId: Constants.bundleID + ".\(name)Tests",
                  infoPlist: .default,
                  sources: ["Tests/**"],
                  dependencies: [
                    .target(name: name)
                  ]
    )
  }
  
  static func makeUITestTarget(name: String) -> Target {
    Target.target(name: "\(name)UITests",
                  destinations: .iOS,
                  product: .uiTests,
                  bundleId: Constants.bundleID + ".\(name)UITests",
                  infoPlist: .default,
                  sources: ["UITests/**"],
                  dependencies: [
                    .target(name: name)
                  ]
    )
  }
  
}

private extension Scheme {
  static func makeScheme(target: AppConfiguration, name: String) -> Self {
    scheme(name: "\(name)",
           shared: true,
           buildAction: .buildAction(targets: ["\(name)"]),
           testAction: .targets(["\(name)Tests"],
                                arguments: nil,
                                configuration: target.configurationName,
                                options: .options(coverage: true)),
           runAction: .runAction(configuration: target.configurationName),
           archiveAction: .archiveAction(configuration: target.configurationName),
           profileAction: .profileAction(configuration: target.configurationName),
           analyzeAction: .analyzeAction(configuration: target.configurationName))
  }
}
