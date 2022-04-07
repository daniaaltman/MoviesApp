//
//  MovieData.swift
//  collectionView
//
//  Created by Dania Altman on 07/04/2022.
//

import Foundation
import UIKit

class MovieData {
    var movieName: String = ""
    var moviePic: UIImage?
    var movieRating: Int?
    var movieReleseDate: Date?
    var movieDescription: String?
    
    init(moviewName: String, moviePic: UIImage?, movieRating: Int?, movieReleaseDate: Date?, movieDescription: String?) {
        self.movieDescription = movieDescription
        self.movieName = moviewName
        self.moviePic = moviePic
        self.movieRating = movieRating
        
        
    }
}
