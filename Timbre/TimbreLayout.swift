//
//  TimbreLayout.swift
//  RWDevCon
//
//  Created by Mic Pringle on 02/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

func degressToRadians(degress: Double) -> CGFloat {
    return CGFloat(Double.pi * (degress / 180.0))
}

class TimbreLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for object in super.layoutAttributesForElements(in: rect)! {
            layoutAttributes.append(object.copy() as! UICollectionViewLayoutAttributes)
        }
        
        for attribues in layoutAttributes {
            // Fix cell ko bị tràn ra ngoài collection view
            attribues.frame = attribues.frame.insetBy(dx: 12, dy: 0)
            attribues.transform = CGAffineTransform(rotationAngle: degressToRadians(degress: -14))
        }
        
        return layoutAttributes
    }
}
