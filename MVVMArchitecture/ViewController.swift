//
//  ViewController.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let views = DesinView()

    override func viewDidLoad() {
        super.viewDidLoad()

        views.bt.addTarget(self, action: #selector(btAction), for: .touchUpInside)
        view.addSubview(views)
    }

    @objc func btAction() {
        guard views.vm.model.value?.one == "123" else { return views.vm.valueSet(Model.init(one: "123", two: "456")) }
        views.vm.valueSet(Model.init(one: "456", two: "123"))
    }
}
