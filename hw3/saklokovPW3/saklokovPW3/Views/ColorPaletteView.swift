//
//  ColorPaletteView.swift
//  saklokovPW3
//
//  Created by s.klokov on 20.12.2022.
//

import UIKit

extension ColorPaletteView {
    public final class ColorSliderView: UIControl {
        private let slider = UISlider()
        
        private let colorLabel = UILabel()
        
        private(set) var value: Float
        
        init(colorName: String, value: Float) {
            self.value = value
            super.init(frame: .zero)
            slider.value = value
            colorLabel.text = colorName
            setupView()
            slider.addTarget(self, action: #selector(sliderMoved(_:)), for: .touchDragInside)
        }
            
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupView() {
            let stackView = UIStackView(arrangedSubviews: [colorLabel, slider])
            stackView.axis = .horizontal
            stackView.spacing = 8
            
            self.addSubview(stackView)
//            stackView.pin(to: self, [.left: 12, .top: 12, .right: 12, .bottom: 12])
        }
        
        @objc
        private func sliderMoved(_ slider: UISlider) {
            self.value = slider.value
            sendActions(for: .touchDragInside)
        }
    }
}
