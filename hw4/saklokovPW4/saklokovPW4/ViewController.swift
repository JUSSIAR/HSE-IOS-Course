//
//  ViewController.swift
//  saklokovPW4
//
//  Created by s.klokov on 20.12.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private let commentLabel = UILabel()
    private let valueLabel = UILabel()
    
    private var value: Int = 0
    let incrementButton = UIButton()
    var sv = UIStackView(arrangedSubviews: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupList()
    }
    
    private func setupIncrementButton() {
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.cornerRadius = 12
        incrementButton.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        incrementButton.backgroundColor = .white
        incrementButton.layer.applyShadow()
        
        self.view.addSubview(incrementButton)
        incrementButton.setHeight(to: 48)
        incrementButton.pinTop(to: self.view.centerYAnchor)
        incrementButton.pin(to: self.view, [.left: 24, .right: 24])
        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
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
        
        setupIncrementButton()
        setupValueLabel()

        view.addSubview(setupCommentView())
    }
    
    private func setupCommentView() -> UIView {
        let commentView = UIView()
        commentView.backgroundColor = .white
        commentView.layer.cornerRadius = 12
        view.addSubview(commentView)
        
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
    
    func updateViewSet(value: String) {
        self.sv.addSubview(makeItem(text: value))
    }
    
    private func makeItem(text: String) -> UITextView {
        let textView = UITextView()
        
        textView.text = text
        textView.layer.cornerRadius = 12
        textView.backgroundColor = .white
        textView.layer.applyShadow()
        textView.heightAnchor.constraint(equalTo: textView.widthAnchor).isActive = true
        textView.setHeight(to: 50.0)
        
        return textView
    }
    
    private func setupList() {
        let note1 = makeItem(text: "note 1")
        let note2 = makeItem(text: "note 2")
        let note3 = makeItem(text: "note 3")
        value = 3
        
        self.sv = UIStackView(arrangedSubviews: [note1, note2, note3])
        
        self.sv.spacing = 5
        self.sv.axis = .vertical
        self.sv.distribution = .fillEqually
        
        self.view.addSubview(sv)
        
        self.sv.pin(to: self.view, [.left: 24, .right: 24])
        self.sv.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor, 24)
    }
    
    private func updateUI() {
        valueLabel.text = "\(value)"
        updateViewSet(value: "note " + valueLabel.text!)
    }
    
    @objc
    private func incrementButtonPressed() {
        value += 1
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        
        UIView.animate(withDuration: 1) {
            self.updateUI()
        }
    }
}

