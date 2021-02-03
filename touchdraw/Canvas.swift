//
//  Canvas.swift
//  touchdraw
//
//  Created by Oleg on 2/1/21.
//

import UIKit

class Canvas: UIView {
    
    var lines  = [[CGPoint]]()
    var lineWidth = 1.0
    var lineColor : UIColor = .black
    var lineWidthArray = [Double]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let point = touches.first?.location(in: self) {
            
            if var lastLine = lines.popLast() {
                lastLine.append(point)
                lines.append(lastLine)
            }
        }
        self.setNeedsDisplay()
        
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            
            context.setStrokeColor(lineColor.cgColor)
            
            for line in lines {
               for (index, point) in line.enumerated() {
                    if index == 0 {
                        context.move(to: point)
                    } else {
                        context.addLine(to: point)
                        context.setLineWidth(CGFloat(lineWidth))
                    }
                }
            }
            
        context.strokePath()
            
        }
       
    }
}
