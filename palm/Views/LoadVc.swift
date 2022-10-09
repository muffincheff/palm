//
//  LoadVc.swift
//  palm
//
//  Created by orca on 2022/10/05.
//

import UIKit
import SnapKit

class LoadVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 250/255, green: 240/255, blue: 200/255, alpha: 1)
        
        // print font names
//        for fontFamily in UIFont.familyNames {
//            for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
//                print(fontName)
//            }
//        }
        
        // logo
        let logo = UILabel()
        logo.font = UIFont(name: "PyeongChangPeace-Bold", size: 50)
        logo.text = "PALM"
        logo.textColor = .systemYellow
        self.view.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-40)
            make.centerX.equalToSuperview()
            make.height.width.greaterThanOrEqualTo(50)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500), execute: DispatchWorkItem{
            _scene.transition(scene: Scenes.chat, style: .modal(.fullScreen))
        })
    }
    
}
