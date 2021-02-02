//
//  ViewController.swift
//  touchdraw
//
//  Created by Oleg on 2/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        canvas.frame = view.frame
    }


}

