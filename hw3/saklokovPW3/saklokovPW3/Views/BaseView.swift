//
//  View.swift
//  saklokovPW3
//
//  Created by s.klokov on 20.12.2022.
//

import UIKit


extension CALayer {
    func applyShadow(scale: Bool = true) {
        self.masksToBounds = false
        self.shadowColor = UIColor.gray.cgColor
        self.shadowOpacity = 0.15
        self.shadowOffset = .zero
        self.shadowRadius = 5
    }
}

extension UIView {
    
    
    // Side resolver as enum type
    
    enum SideToPin {
        case top
        case left
        case right
        case bottom
    }
    
    
    // Pin specializations
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        pinTop(to: superView)
        pinLeft(to: superView)
        pinRight(to: superView)
        pinBottom(to: superView)
    }
    
    func pin(to superView: UIView, _ sides: SideToPin...) {
        translatesAutoresizingMaskIntoConstraints = false
        for side in sides {
            caseResolver(superView, side)
        }
    }
    
    
    func pin(to superView: UIView, _ sides: [SideToPin], _ const: Double = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        for side in sides {
            caseResolver(superView, side, const)
        }
    }
    
    func pin(to superView: UIView, _ sides: [SideToPin: Double]) {
        translatesAutoresizingMaskIntoConstraints = false
        for side in sides {
            caseResolver(superView, side.key, side.value)
        }
    }
    
    func pin(to superView: UIView, excluding: SideToPin, _ const: Double = 0) {
        var sides: [SideToPin] = [.top, .left, .right, .bottom]
        sides = sides.filter { $0 != excluding }
        pin(to: superView, sides, const)
    }
    
    func caseResolver(_ view: UIView, _ side: SideToPin, _ const: Double = 0) {
        switch side {
            case .top:
                pinTop(to: view, const)
            case .left:
                pinLeft(to: view, const)
            case .right:
                pinRight(to: view, const)
            case .bottom:
                pinBottom(to: view, const)
        }
    }
    
    
    // Size managing
    
    @discardableResult
    func setHeight(to height: Double) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: CGFloat(height))
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func setWidth(to width: Double) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalToConstant: CGFloat(width))
        constraint.isActive = true
        return constraint
    }
    
    
    // Left anchor
    
    @discardableResult
    func pinLeft(to superView: UIView, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(equalTo: superView.leadingAnchor,constant: CGFloat(const))
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinLeft(to anchor: NSLayoutXAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: CGFloat(const))
        constraint.isActive = true
        return constraint
    }
    
    
    // Right anchor
    
    @discardableResult
    func pinRight(to superView: UIView, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -CGFloat(const))
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinRight(to anchor: NSLayoutXAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: -CGFloat(const))
        constraint.isActive = true
        return constraint
    }
    
    
    // Top anchor
    
    @discardableResult
    func pinTop(to superView: UIView, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(equalTo: superView.topAnchor, constant: CGFloat(const))
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinTop(to anchor: NSLayoutYAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(equalTo: anchor, constant: CGFloat(const))
        constraint.isActive = true
        return constraint
    }
    
    
    // Bottom anchor
    
    @discardableResult
    func pinBottom(to superView: UIView, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -CGFloat(const))
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinBottom(to anchor: NSLayoutYAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: -CGFloat(const))
        constraint.isActive = true
        return constraint
    }
    
    
    // Size anchors resolving
    
    @discardableResult
    func pinHeight(to height: NSLayoutDimension, _ multiplier: Double = 1) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraint(equalTo: height, multiplier: CGFloat(multiplier))
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinWidth(to width: NSLayoutDimension, _ multiplier: Double = 1) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraint(equalTo: width, multiplier: CGFloat(multiplier))
        constraint.isActive = true
        return constraint
    }
    
    
    // Center anchors
    
    func pinCenter(to view: UIView, _ const: Double = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: CGFloat(const)).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(const)).isActive = true
    }
    
    
    // Pin at the center with vertical & horizontal
    
    @discardableResult
    func pinCenter(to xAnchor: NSLayoutXAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = centerXAnchor.constraint(equalTo: xAnchor, constant: CGFloat(const))
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinCenter(to yAnchor: NSLayoutYAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = centerYAnchor.constraint(equalTo: yAnchor, constant: CGFloat(const))
        constraint.isActive = true
        return constraint
    }
}
