//
//  ViewController.swift
//  touchdraw
//
//  Created by Oleg on 2/1/21.
//

import UIKit

class ViewController: UIViewController {
    let canvas = Canvas()
    
    @IBOutlet weak var sliderValue: UISlider!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        canvas.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 800)
    }

    
    @IBAction func colorChanged(_ sender: UIButton) {
        canvas.lineColor = sender.backgroundColor!
        print(canvas.lineColor)
    }
    
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        canvas.lineWidth = Double(sliderValue.value)
        canvas.setNeedsDisplay()
    }
    
    
}

