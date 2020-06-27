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
        var layoutAttributes = super.layoutAttributesForElements(in: rect)!
        for attribues in layoutAttributes {
            attribues.transform = CGAffineTransform(rotationAngle: degressToRadians(degress: -14))
        }
        
        return layoutAttributes
    }
}
