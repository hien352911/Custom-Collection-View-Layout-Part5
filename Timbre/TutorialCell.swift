//
//  TutorialCell.swift
//  RWDevCon
//
//  Created by Mic Pringle on 02/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class TutorialCell: UICollectionViewCell {
  
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageViewCenterYLayoutConstraint: NSLayoutConstraint!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var timeAndRoomLabel: UILabel!
  @IBOutlet private weak var speakerLabel: UILabel!
    
    var parallaxOffset: CGFloat = 0 {
        didSet {
            imageViewCenterYLayoutConstraint.constant = parallaxOffset
        }
    }
  
  var tutorial: Tutorial? {
    didSet {
      if let tutorial = tutorial {
        imageView.image = tutorial.backgroundImage
        titleLabel.text = tutorial.title
        timeAndRoomLabel.text = tutorial.timeAndRoom
        speakerLabel.text = tutorial.speaker
      }
    }
  }
  
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        imageView.transform = CGAffineTransform(rotationAngle: degreesToRadians(degrees: 14))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clipsToBounds = false
    }
    
    func updateParallaxOffset(collectionViewBounds bounds: CGRect) {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let offsetFromCenter = CGPoint(x: center.x - self.center.x,
                                       y: center.y - self.center.y)
        let maxVerticalOffset = (bounds.height / 2) + (self.bounds.height / 2)
        let scaleFactor = 40 / maxVerticalOffset
        parallaxOffset = -offsetFromCenter.y * scaleFactor
    }
}
