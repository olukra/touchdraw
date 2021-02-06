//
//  Canvas.swift
//  touchdraw
//
//  Created by Oleg on 2/1/21.
//

import UIKit

class Canvas: UIView {
    
    var lines = [LineData]()
    var lineWidth = 5.0
    var lineColor = UIColor.black
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(LineData(points: [], width: lineWidth, colour: lineColor))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let point = touches.first?.location(in: self) {
            if var lastLine = lines.popLast() {
                lastLine.points.append(point)
                lines.append(lastLine)
            }
        }
        self.setNeedsDisplay()
    }
    
    func changeLineColor(color: UIColor) {
        lineColor = color
    }
    
    func changeLineWith(widht: Double) {
        lineWidth = widht
    }
    
    func undoLine () {
        let _ = lines.popLast()
        setNeedsDisplay()
    }
    
    func clearCanvas() {
        lines.removeAll()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            for line in lines {
                context.setStrokeColor(line.colour.cgColor)
                context.setLineWidth(CGFloat(line.width))
                for (index, point) in line.points.enumerated() {
                    if index == 0 {
                        context.move(to: point)
                    } else {
                        context.addLine(to: point)
                    }
                }
            context.strokePath()
            }
        }
    }
    
}
