//
//  GradientView.swift
//  RWDevCon
//
//  Created by Mic Pringle on 02/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
  
    private var colors = [UIColor.clear.cgColor, UIColor.clear.cgColor]
  
  @IBInspectable var startColor: UIColor? {
    didSet {
      if let color = startColor {
        swapColorAtIndex(index: 0, withColor: color.cgColor)
      }
    }
  }
  
  @IBInspectable var endColor: UIColor? {
    didSet {
      if let color = endColor {
        swapColorAtIndex(index: 1, withColor: color.cgColor)
      }
    }
  }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
  
  override func awakeFromNib() {
    prepareView()
  }
  
  override func prepareForInterfaceBuilder() {
    prepareView()
  }
  
  private func prepareView() {
    let layer = self.layer as! CAGradientLayer
    layer.startPoint = CGPoint(x: 0.0, y: 0.5)
    layer.endPoint = CGPoint(x: 1.0, y: 0.5)
  }
  
    private func swapColorAtIndex(index: Int, withColor color: CGColor) {
        colors.remove(at: index)
        colors.insert(color, at: index)
        let layer = self.layer as! CAGradientLayer
    layer.colors = colors
  }
  
}
