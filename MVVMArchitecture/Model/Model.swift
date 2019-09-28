//
//  Model.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//
import Foundation
struct Model: Codable {

   let body: [Nested]

      struct Nested: Codable {

          let url: URL
          let title: String

      }
}
