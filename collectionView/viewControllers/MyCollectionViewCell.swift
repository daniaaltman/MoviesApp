//
//  MyCollectionViewCell.swift
//  collectionView
//
//  Created by Dania Altman on 07/04/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var movieName: UILabel!
    var size: CGFloat?
    static let identifier = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    public func configure (with movie: MovieData) {
        imageView?.image = movie.image
        movieName.text = movie.title
        yearLabel.text = movie.releaseDate
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
