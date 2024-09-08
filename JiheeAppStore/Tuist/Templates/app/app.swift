//
//  app.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/8/24.
//

import ProjectDescription

let nameAttribute = Template.Attribute.required("name")

let template = Template(
  description: "App template",
  attributes: [
    nameAttribute,
  ],
  items: [
    .file(
        path: "\(nameAttribute)/Tests/UnitTests/\(nameAttribute)Tests.swift",
        templatePath: "Soureces/baseUnitTest.stencil"
    )]
)
