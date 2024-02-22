//
//  ViewController.swift
//  gorilla01
//
//  Created by Ilryc Marokonen on 05.02.2024.
//

import UIKit
import Foundation
import SnapKit

class SpotlightController: UIViewController {
    
    private let spotlightView = SpotlightView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(spotlightView)
        setupSpotlightView()
        setup(button: spotlightView.button)
        buttonAction()
        
    }
    // MARK: - Functions (Public)
    func setup(button: UIButton) {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func buttonAction() {
        spotlightView.button.addAction(UIAction(handler: { _ in self.spotlightView.switchMode() }), for: .touchUpInside )
    }
 
    
    // MARK: - Functions (Private)
    private func setupSpotlightView() {
        spotlightView.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(200)
            make.height.greaterThanOrEqualTo(20)
            make.top.equalTo(60)
            make.centerX.equalToSuperview()
        }
    }
}
