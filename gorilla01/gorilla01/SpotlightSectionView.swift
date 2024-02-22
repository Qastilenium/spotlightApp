//
//  SpotlightSectionView.swift
//  gorilla01
//
//  Created by Ilryc Marokonen on 07.02.2024.
//

import UIKit

enum Colours {
    case red
    case orange
    case green
    
    func colour() -> UIColor {
        switch self {
        case .red:
            return UIColor.red // этот red не является case .red, ведь бэкграунд колор это свойство класса UIcolor
        case .orange:
            return .orange
        case .green:
           return .green
        }
    }
}

class SpotlightSectionView: UIView {
    
    private var colourLight: Colours?
    
    init(colourLight: Colours) {
        super.init(frame: .zero)
        self.colourLight = colourLight
        preparationForInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func preparationForInit() {
        self.layer.cornerRadius = frame.size.height / 2
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        preparationForInit()
    }
    
    func setColourLight(_ colourLight: Colours) {
        self.colourLight = colourLight
    }
    
    func turnOn() {
        backgroundColor = colourLight?.colour()
    }
    
    func turnOff() {
        backgroundColor = .clear
    }
    
    func isSwitcherOff() -> Bool { backgroundColor == .clear }
    func isSwitcherOn() -> Bool { !isSwitcherOff() }
}
