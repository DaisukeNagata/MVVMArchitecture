//
//  DesinView.swift
//  SampleMVVM
//
//  Created by 永田大祐 on 2019/09/28.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import UIKit

final class DesinView: UIView {

    let vm      : ViewModel
    let labelOne: UILabel
    let imageOne: UIImageView
    let labelTwo: UILabel
    let imageTwo: UIImageView
    let bt      : UIButton

    private let topHeight: CGFloat = UINavigationController.init().navigationBar.frame.height +
    (UIWindow.init().windowScene?.statusBarManager?.statusBarFrame.height ?? UIApplication.shared.statusBarFrame.height)

    init(vm: ViewModel, labelOne: UILabel, imageOne: UIImageView, labelTwo: UILabel, imageTwo: UIImageView, bt: UIButton) {
        self.vm       = vm
        self.labelOne = labelOne
        self.imageOne = imageOne
        self.labelTwo = labelTwo
        self.imageTwo = imageTwo
        self.bt       = bt
        super.init(frame:.zero)
        
        desgin()
        observe()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func desgin() {
        self.frame = UIScreen.main.bounds
        self.addSubview(labelOne)
        self.addSubview(imageOne)
        self.addSubview(labelTwo)
        self.addSubview(imageTwo)
        self.addSubview(bt)

        LayoutAnchor().layoutAnchor(labelOne,
                                    xAnchor         : self.centerXAnchor,
                                    yAnchor         : self.topAnchor,
                                    constantY       : topHeight,
                                    widthmultiplier : 1,
                                    heightmultiplier: 0.1,
                                    widthAnchor     : self.widthAnchor,
                                    heightAnchor    : self.heightAnchor)

        LayoutAnchor().layoutAnchor(imageOne,
                                    xAnchor         : self.centerXAnchor,
                                    constantX       : self.frame.width/2 - self.frame.width/9.96,
                                    yAnchor         : self.topAnchor,
                                    constantY       : topHeight,
                                    widthmultiplier : 0.2,
                                    heightmultiplier: 0.1,
                                    widthAnchor     : self.widthAnchor,
                                    heightAnchor    : self.heightAnchor)

        LayoutAnchor().layoutAnchor(labelTwo,
                                    xAnchor         : self.centerXAnchor,
                                    yAnchor         : labelOne.bottomAnchor,
                                    widthmultiplier : 1,
                                    heightmultiplier: 0.1,
                                    widthAnchor     : self.widthAnchor,
                                    heightAnchor    : self.heightAnchor)
    
        LayoutAnchor().layoutAnchor(imageTwo,
                                    xAnchor         : self.centerXAnchor,
                                    constantX       : self.frame.width/2 - self.frame.width/9.96,
                                    yAnchor         : labelOne.bottomAnchor,
                                    widthmultiplier : 0.2,
                                    heightmultiplier: 0.1,
                                    widthAnchor     : self.widthAnchor,
                                    heightAnchor    : self.heightAnchor)

        LayoutAnchor().layoutAnchor(bt,
                                    xAnchor         : self.centerXAnchor,
                                    yAnchor         : labelTwo.bottomAnchor,
                                    widthmultiplier : 1,
                                    heightmultiplier: 0.1,
                                    widthAnchor     : self.widthAnchor,
                                    heightAnchor    : self.heightAnchor)

        labelOne.backgroundColor = .red
        labelTwo.backgroundColor = .blue
        bt.backgroundColor = .yellow
    }

    private func observe() {
        vm.observe(for: vm.api?.model ?? Observable()) {
            [weak self ](value) in
            guard let selfStrong = self else { return }
            _ = value.body.map { v in
                let data = try? Data(contentsOf: v.url)
                let ima = UIImage(data: data ?? Data())

                if selfStrong.imageOne.image == nil {
                    selfStrong.labelTwo.text = v.title
                    selfStrong.imageTwo.image = ima
                }
                selfStrong.labelOne.text = v.title
                selfStrong.imageOne.image = ima
            }
        }
    }
}
