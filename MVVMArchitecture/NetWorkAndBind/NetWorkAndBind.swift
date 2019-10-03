//
//  NetWorkAndBind.swift
//  MVVMArchitecture
//
//  Created by 永田大祐 on 2019/09/30.
//  Copyright © 2019 永田大祐. All rights reserved.
//
import Foundation

protocol NetWorkAndBind {
      func networkIsReady<M>(completion: @escaping (_ model: M?) -> Void)
      func request<M>(from url: URL, _ completion: @escaping (Result<M, Error>) -> Void)
}
