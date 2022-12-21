//
//  ColorPaletteViewController.swift
//  saklokovPW3
//
//  Created by s.klokov on 20.12.2022.
//

import UIKit

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}

final class ColorPaletteView: UIControl {
    private let stackView = UIStackView()

    private(set) var chosenColor: UIColor = .systemGray6

    init() {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupView() {
        let redControl = ColorSliderView(colorName: "R", value: Float(chosenColor.rgba.red))
        let greenControl = ColorSliderView(colorName: "G", value: Float(chosenColor.rgba.green))
        let blueControl = ColorSliderView(colorName: "B", value: Float(chosenColor.rgba.blue))
        
        redControl.tag = 0
        greenControl.tag = 1
        blueControl.tag = 2
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(redControl)
        stackView.addArrangedSubview(greenControl)
        stackView.addArrangedSubview(blueControl)
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 12
        
        [redControl, greenControl, blueControl].forEach { $0.addTarget(self, action: #selector(sliderMoved(slider:)),
            for: .touchDragInside)
        }

        self.addSubview(stackView)
        stackView.pin(to: self)

    }

    @objc
    private func sliderMoved(slider: ColorSliderView) {
        switch slider.tag {
        case 0:
            self.chosenColor = UIColor(
                red: CGFloat(slider.value),
                green: chosenColor.rgba.green,
                blue: chosenColor.rgba.blue,
                alpha: chosenColor.rgba.alpha
            )
        case 1:
            self.chosenColor = UIColor(
                red: chosenColor.rgba.red,
                green: CGFloat(slider.value),
                blue: chosenColor.rgba.blue,
                alpha: chosenColor.rgba.alpha
            )
        default:
            self.chosenColor = UIColor(
                red: chosenColor.rgba.red,
                green: chosenColor.rgba.green,
                blue: CGFloat(slider.value),
                alpha: chosenColor.rgba.alpha
            )
        }

        sendActions(for: .touchDragInside)
    }
}
