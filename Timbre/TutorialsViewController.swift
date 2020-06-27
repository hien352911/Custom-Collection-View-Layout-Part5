//
//  TutorialsViewController.swift
//  RWDevCon
//
//  Created by Mic Pringle on 27/02/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class TutorialsViewController: UICollectionViewController {
  
  let tutorials = Tutorial.allTutorials()
  let palette = UIColor.palette()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView!.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: collectionView!.bounds.width, height: 140)
  }
  
}

extension TutorialsViewController {
  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tutorials.count
  }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialCell", for: indexPath) as! TutorialCell
        cell.tutorial = tutorials[indexPath.item]
        cell.contentView.backgroundColor = palette[indexPath.item]
        return cell
    }
  
}