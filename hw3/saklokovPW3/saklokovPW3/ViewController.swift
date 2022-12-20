//
//  ViewController.swift
//  saklokovPW3
//
//  Created by s.klokov on 20.12.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private let commentLabel = UILabel()
    private let valueLabel = UILabel()
    
    private var value: Int = 0

    let incrementButton = UIButton()
    let buttonsSV = UIStackView()
    let colorPaletteView = ColorPaletteView()
    let commentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupMenuButtons()
    }
    
    private func setupIncrementButton() {
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.cornerRadius = 12
        incrementButton.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        incrementButton.backgroundColor = .white
        incrementButton.layer.applyShadow()
        
//        self.view.addSubview(incrementButton)
//        incrementButton.setHeight(to: 48)
//        incrementButton.pinTop(to: self.view.centerYAnchor)
//        incrementButton.pin(to: self.view, [.left: 24, .right: 24])
//        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
     }
                                   
    private func setupValueLabel() {
        valueLabel.font = .systemFont(ofSize: 40.0, weight: .bold)
        valueLabel.textColor = .black
        valueLabel.text = "\(value)"
        
        self.view.addSubview(valueLabel)
        
        valueLabel.pinBottom(to: incrementButton.topAnchor, 16)
        valueLabel.pinCenter(to: self.view.centerXAnchor)
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        
        commentView.isHidden = true
        colorPaletteView.isHidden = true
        
        setupIncrementButton()
        setupMenuButtons()
        setupColorControlSV()
        setupValueLabel()
    }
    
    private func setupCommentView() -> UIView {
        let commentView = UIView()
        commentView.backgroundColor = .white
        commentView.layer.cornerRadius = 12
        
        self.view.addSubview(commentView)
        
        commentView.pinTop(to: self.view.safeAreaLayoutGuide.topAnchor)
        commentView.pin(to: self.view, [.left: 24, .right: 24])
        
        commentLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
        commentLabel.textColor = .systemGray
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .center
        
        commentView.addSubview(commentLabel)
        commentLabel.pin(to: commentView, [.top: 16, .left: 16, .bottom: 16, .right: 16])
        return commentView
    }
    
    private func makeMenuButton(title: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.backgroundColor = .white
        button.layer.applyShadow()
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        
        return button
    }
    
    private func setupMenuButtons() {
        let colorsButton = makeMenuButton(title: " 🎨 ")
        let notesButton = makeMenuButton(title: " 📔 ")
        let newsButton = makeMenuButton(title: " 🗞 ")
        let buttonsSV = UIStackView(arrangedSubviews: [colorsButton, notesButton, newsButton])
        
        colorsButton.addTarget(self, action: #selector(paletteButtonPressed), for: .touchUpInside)
        
        buttonsSV.spacing = 12
        buttonsSV.axis = .horizontal
        buttonsSV.distribution = .fillEqually
        
        self.view.addSubview(buttonsSV)
        
        buttonsSV.pin(to: self.view, [.left: 24, .right: 24])
        buttonsSV.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor, 24)
    }
    
    private func setupColorControlSV() {
        self.colorPaletteView.isHidden = true
        self.view.addSubview(colorPaletteView)
        self.colorPaletteView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.colorPaletteView.topAnchor.constraint(equalTo: incrementButton.bottomAnchor, constant: 8),
            self.colorPaletteView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            self.colorPaletteView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            self.colorPaletteView.bottomAnchor.constraint(equalTo: buttonsSV.topAnchor, constant: -8)
        ])
        self.colorPaletteView.addTarget(self, action: #selector(changeColor(_:)), for: .touchDragInside)
    }
    
    private func updateUI() {
        valueLabel.text = "\(value)"
    }
    
    @objc
    private func incrementButtonPressed() {
        value += 1
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        self.updateUI()
    }
    
    @objc
    private func paletteButtonPressed() {
        colorPaletteView.isHidden.toggle()
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }

    @objc
    private func changeColor(_ slider: ColorPaletteView) {
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = slider.chosenColor
        }
    }
}
