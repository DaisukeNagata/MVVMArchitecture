//
//  ViewController.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    let views = DesinView(vm: ViewModel(),labelOne: UILabel(), imageOne: UIImageView(), labelTwo: UILabel(), imageTwo: UIImageView(), bt: UIButton())
    let sample = ModelPrimitive()

    override func viewDidLoad() {
        super.viewDidLoad()

        views.bt.addTarget(self, action: #selector(btAction), for: .touchUpInside)
        view.addSubview(views)
        views.vm.conect(URLComponent.exampleUrl)
    }

    @objc func btAction() {
        if sample.one == "11"  {
            views.vm.modelPrimitive?.value = nil
            sample.one = "1"
            sample.two = "2"
            views.vm.titleSet(sample)
        } else {
            views.vm.modelPrimitive?.value = nil
            sample.one = "11"
            sample.two = "22"
            views.vm.titleSet(sample)
        }
    }
}
