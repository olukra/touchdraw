//
//  Canvas.swift
//  touchdraw
//
//  Created by Oleg on 2/1/21.
//

import UIKit

class Canvas: UIView {
    
    var points  = [[CGPoint]]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        points.append([CGPoint]())
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let point = touches.first?.location(in: self) {
            
            if var lastLine = points.popLast() {
                lastLine.append(point)
                points.append(lastLine)
            }
        }
        self.setNeedsDisplay()
        
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(UIColor.green.cgColor)
            context.setLineWidth(7)
            for point in points {
               for (index, point) in point.enumerated() {
                    if index == 0 {
                        context.move(to: point)
                    } else {
                        context.addLine(to: point)
                    }
                }
            }
            
        context.strokePath()
            
        }
       
    }
}
