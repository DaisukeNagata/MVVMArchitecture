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
        view.addSubview(views.labelOne)
        view.addSubview(views.labelTwo)
        view.addSubview(views.bt)

        views.vm.observe(for: views.vm.model) {
            [weak self ](value) in
            guard let selfStrong = self else { return }
            selfStrong.views.labelOne.text = value.one
            selfStrong.views.labelTwo.text = value.two
        }
    }

    @objc func btAction() {
        if views.labelOne.text == "456" {
            views.vm.valueSet("123", two: "456")
        } else {
            views.vm.valueSet("456", two: "123")
        }
    }
}
