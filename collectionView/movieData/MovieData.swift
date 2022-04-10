//
//  MovieData.swift
//  collectionView
//
//  Created by Dania Altman on 08/04/2022.
//

import UIKit

class MovieData {
    var posterLink: String = ""
    var title: String = ""
    var voteAverage: Float?
    var releaseDate: String = ""
    var overview: String = ""
    var image: UIImage?
    
    init (_ posterLink: String, _ title: String, _ voteAverage: Float?, _ releaseDate: String?, _ overview: String?) {
        self.posterLink = posterLink
        self.title = title
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate ?? ""
        self.overview = overview ?? ""
    }
    
    convenience init (_ movie: MovieApi.Response.Movie) {
        self.init(movie.poster_path, movie.title, movie.vote_average, movie.release_date, movie.overview)
    }
}
