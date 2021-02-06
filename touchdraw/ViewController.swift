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
  
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        canvas.clearCanvas()
    }
    
    @IBAction func undoButtonPressed(_ sender: Any) {
        canvas.undoLine()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        canvas.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 800)
    }

    
    @IBAction func colorChanged(_ sender: UIButton) {
        canvas.changeLineColor(color: sender.backgroundColor!)
    }
    
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        canvas.changeLineWith(widht: Double(sliderValue.value)) 
       
    }
    
    
}

