//
//  MovieInfo.swift
//  collectionView
//
//  Created by Dania Altman on 09/04/2022.
//

import Foundation
import UIKit

class MovieInfo: UIViewController {
    
    @IBOutlet weak var nav: UINavigationItem!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    var movieData: MovieData?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nav.title = movieData?.title
        image.image = movieData?.image
        releaseDate.text = movieData?.releaseDate
        movieDescription.text = movieData?.overview
        let rate = NSNumber(value: movieData?.voteAverage ?? 0.0)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        rating.text = formatter.string(from: rate)
    }
    
//    class func instanceFromNib() -> MovieInfo {
//        return UINib(nibName: "nib file name", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MovieInfo
//    }
    
    func setMovie (movieData: MovieData) {
       // self.navigationItem.title = movieData.title
        //nav.title = movieData.title
        self.movieData = movieData
        //        rating.text = String(
     //   reealseDate.text = movieData.releaseDate
    //    movieDescription.text = movieData.overview
        
    }
    
}
