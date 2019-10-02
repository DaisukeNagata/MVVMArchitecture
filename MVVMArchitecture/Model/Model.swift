//
//  Model.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//
import Foundation

struct Model: Codable {

    var body: [Nested]

      struct Nested: Codable {

        var url: URL
        var title: String

      }
}
