//
//  NetWorkAndBind.swift
//  MVVMArchitecture
//
//  Created by 永田大祐 on 2019/09/30.
//  Copyright © 2019 永田大祐. All rights reserved.
//
import Foundation

protocol NetWorkAndBind {
    func networkIsReady<M>(_ url: URL, completion: @escaping (M) -> Void)
    func request<M>(from url: URL, _ completion: @escaping (Result<M, Error>) -> Void)
}
