//
//  NetWorkAndBind.swift
//  MVVMArchitecture
//
//  Created by 永田大祐 on 2019/09/30.
//  Copyright © 2019 永田大祐. All rights reserved.
//
import Foundation

protocol NetWorkAndBind {
      func networkIsReady()
      func request<J>(from url: URL, _ completion: @escaping (Result<J, Error>) -> Void)
}
