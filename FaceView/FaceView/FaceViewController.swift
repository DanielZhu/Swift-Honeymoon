//
//  FaceViewController.swift
//  FaceView
//
//  Created by MengDan Zhu on 07/11/2016.
//  Copyright © 2016 Staydan.com. All rights reserved.
//

import UIKit

class FaceViewController: UIView {
  
  let scale: CGFloat = 0.9
  
  var faceRadio: CGFloat {
    return min(bounds.size.width, bounds.size.height) / 2 * scale
  }
  var faceCenter: CGPoint {
    return CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
  }
  
  private func drawRadiusCircleWithCenter(withCenter center: CGPoint, radius: CGFloat) -> UIBezierPath {
    let path = UIBezierPath()
    path.addArc(withCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
    
    path.lineWidth = 5.0
    UIColor.white.setFill()
    UIColor.red.setStroke()
    
    path.fill()
    
    return path
  }
  
  enum Eyes {
    case leftSide
    case rightSide
  }
  
  private func getEyeCenter(side: Eyes) -> CGPoint {
    var center = CGPoint(x: faceCenter.x, y: faceCenter.y - faceRadio / 3);
    let offsets = faceRadio * 1/3
    switch side {
    case .leftSide:
      center.x -= offsets
    case .rightSide:
      center.x += offsets
    }
  
    return center
  }
  
  private func eyeForSide(side: Eyes) {
    let eyeRadio = faceRadio * 0.1
    
    switch side {
    case .leftSide:
      drawRadiusCircleWithCenter(withCenter: getEyeCenter(side: .leftSide), radius: eyeRadio).stroke()
    case .rightSide:
      drawRadiusCircleWithCenter(withCenter: getEyeCenter(side: .rightSide), radius: eyeRadio).stroke()
    }
  }
  
  
  private func drawEye() {
    eyeForSide(side: .leftSide)
    eyeForSide(side: .rightSide)
  }
  
  private func drawFace() {
    drawRadiusCircleWithCenter(withCenter: faceCenter, radius: faceRadio).stroke()
  }
  
  private func drawMouth(feeling: CGFloat) {
    let mouthHeight = faceRadio * 0.2
    let mouthWidth = faceRadio
    let mouthStartPoint = CGPoint(x: faceCenter.x - mouthWidth / 2, y: faceCenter.y + faceRadio / 3)
    let controlPointY = mouthStartPoint.y + feeling * mouthHeight
    
    let path = UIBezierPath()
    path.move(to: mouthStartPoint)
    path.addCurve(
      to: CGPoint(x: mouthStartPoint.x + mouthWidth, y: mouthStartPoint.y),
      controlPoint1: CGPoint(x: mouthStartPoint.x + mouthWidth * 1 / 3, y: controlPointY),
      controlPoint2: CGPoint(x: mouthStartPoint.x + mouthWidth * 2 / 3, y: controlPointY)
    )
    
    path.lineWidth = 5.0
    UIColor.white.setFill()
    UIColor.red.setStroke()
    path.stroke()
    path.fill()
  }
  
  override func draw(_ rect: CGRect) {
    drawFace()
    drawEye()
    
    drawMouth(feeling: CGFloat(1.0))
  }
}
