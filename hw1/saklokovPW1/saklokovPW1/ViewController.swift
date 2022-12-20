//
//  ViewController.swift
//  saklokovPW1
//
//  Created by s.klokov on 20.12.2022.
//

import UIKit

class ViewController: UIViewController {
    var ANIMATION_DURATION = 2.0
    
    @IBOutlet var screen: UIView!
    @IBOutlet var viewList: [UIView]!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.button1.setTitle("Press me", for: .normal)
        
        presetViewsBoundsRadius()
        presetViewsSizes()
    }

    @IBAction func changeColorButtonPressed(_ sender: Any) {
        var colorSet = Set<UIColor>()
        let button = sender as? UIButton
        
        button?.isEnabled = false
        while colorSet.count < self.viewList.count {
            colorSet.insert(generateRandomColorInstance())
        }
        
        UIView.animate(withDuration: self.ANIMATION_DURATION, animations: {
            for view in self.viewList {
                view.backgroundColor = colorSet.popFirst()
            }
        }) {
            completion in button?.isEnabled = true
        }
    }
    
    func generateRandomColorInstance() -> UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
    
    func presetViewsBoundsRadius() {
        for view in self.viewList {
            view.layer.cornerRadius = 10
        }
    }
    
    func presetViewsSizes() {
        let screenHeight = self.screen.frame.size.height
        let screenWidth = self.screen.frame.size.width
        
        let idealHeight = 568.0
        let idealWidth = 320.0
        
        for view in self.viewList {
            let height = view.frame.size.height
            let width = view.frame.size.width
            
            let newHeight = height / idealHeight * screenHeight
            let newWidth = width / idealWidth * screenWidth
            
            view.frame.size.height = newHeight
            view.frame.size.width = newWidth
        }
    }
    
}
