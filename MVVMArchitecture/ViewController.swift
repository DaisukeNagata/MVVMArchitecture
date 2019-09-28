//
//  ViewController.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    let views = DesinView()

    override func viewDidLoad() {
        super.viewDidLoad()

        views.bt.addTarget(self, action: #selector(btAction), for: .touchUpInside)
        view.addSubview(views)

        views.vm.observe(for: views.vm.model) {
            [weak self ](value) in
            guard let selfStrong = self else { return }
            _ = value.body.map { v in
                
                let data = try? Data(contentsOf: v.url)
                let ima = UIImage(data: data ?? Data())
                
                if selfStrong.views.imageOne.image == nil {
                    selfStrong.views.labelTwo.text = v.title
                    selfStrong.views.imageTwo.image = ima
                }
                
                selfStrong.views.labelOne.text = v.title
                selfStrong.views.imageOne.image = ima
            }
        }
    }

    @objc func btAction() {
        views.vm.networkIsReady()
    }
}
