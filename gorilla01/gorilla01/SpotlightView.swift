//
//  SpotlightView.swift
//  gorilla01
//
//  Created by Ilryc Marokonen on 08.02.2024.
//

import UIKit
import SnapKit



class SpotlightView: UIView {
    // MARK: - Properties
    private var redView = SpotlightSectionView(colourLight: .red)
    private var orangeView = SpotlightSectionView(colourLight: .orange)
    private var greenView = SpotlightSectionView(colourLight: .green)
    
    private let sections: [SpotlightSectionView] = [SpotlightSectionView(colourLight: .red),
                                                    SpotlightSectionView(colourLight: .orange),
                                                    SpotlightSectionView(colourLight: .green)]
    
    private let stackView = UIStackView(frame: .zero)
    
    // MARK: - Button stuff
    lazy var button: UIButton = {
        let switchButton = UIButton(type: .system)
        switchButton.tintColor = .systemTeal
        switchButton.setTitle("Switch!", for: .normal)
        switchButton.tintColor = .white
        switchButton.setBackgroundImage(.pixel(ofColor: .systemBlue), for: .normal)
        switchButton.layer.cornerRadius = 20
        switchButton.layer.masksToBounds = true
        return switchButton
    }()
    
    let touch = UIControl.Event.touchUpInside
    
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        setupStackView()
        setStartValues()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Functions (Public)
    func switchMode()  {
        // если все секции не горят то зажигаем первую
        // если секция горит, то ее выключаем и зажигаем следующую
        if let indexOfFirstOnSection = sections.firstIndex(where: { $0.isSwitcherOn() }), indexOfFirstOnSection < sections.count - 1 {
            // секция горит
            sections[indexOfFirstOnSection].turnOff()
            sections[indexOfFirstOnSection + 1].turnOn()
        } else {
            // секции не горят
           // sections[0].turnOn() ----- первого элемента может не быть, если подан пустой массив
            sections.forEach( {$0.turnOff()} )
            sections.first?.turnOn()
        }
    }
    
    //MARK: - Functions (Private)
    private func setupStackView() {
        self.addSubview(stackView)
        
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.greaterThanOrEqualTo(20)
            make.top.equalTo(60)
            make.centerX.equalToSuperview()
        }
        
        sections.forEach { section in
            stackView.addArrangedSubview(section)
            
            section.snp.makeConstraints { make in
                make.width.height.equalTo(200)
            }
        }
    }
    
    private func setStartValues() {
        sections.forEach( { $0.turnOff() } )
    }
}
