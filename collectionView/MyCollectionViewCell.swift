//
//  MyCollectionViewCell.swift
//  collectionView
//
//  Created by Dania Altman on 07/04/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView?
    
    static let identifier = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    public func configure (with image: UIImage) {
        imageView?.image = image
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
