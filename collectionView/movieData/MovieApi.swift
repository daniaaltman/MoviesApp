//
//  MovieRequest.swift
//  collectionView
//
//  Created by Dania Altman on 07/04/2022.
//

import Foundation
import UIKit

class MovieApi {
    enum requestType {
        case popularity
        case highestRated
        case popularKids
        
        
    }
    
    let base_image = "https://image.tmdb.org/t/p/w220_and_h330_face"
    
    struct Response: Decodable {
        
        let results: [Movie]
        
        struct Movie : Decodable {
            let poster_path: String
            let title: String
            let vote_average: Float
            let release_date: String
            let overview: String
        }
    }
    
    func getUrlByType (type: requestType) -> String {
        switch type {
        case .popularity:
           return "discover/movie?sort_by=popularity.desc&"
        case .highestRated:
           return "/discover/movie/?certification_country=US&certification=R&sort_by=vote_average.desc&"
        case .popularKids:
           return "/discover/movie?certification_country=US&certification.lte=G&sort_by=popularity.desc&"
        }
    }
    
    
    func getMovies(_ type: requestType) async throws -> [Response.Movie] {
        let token = "api_key=0cfd047bf8d2487c8c1b8e5a95ca5afd"
        let maniUrl = "https://api.themoviedb.org/3/"
        let selectedType = getUrlByType(type: type)
        let url = URL(string: "\(maniUrl)\(selectedType)\(token)")!

        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }

        let parsedData = try JSONDecoder().decode(Response.self, from: data)
        let string = String(data: data, encoding: .utf8)
        print(string?.data(using: .utf8)?.prettyPrintedJSONString ?? "no")
        return parsedData.results
    }
    
    func getMovieImage(_ image: String) async throws -> UIImage {
        let url: URL = URL(string: "\(base_image)\(image)")!
        let request = URLRequest(url: url)
        let task: Task<UIImage, Error> = Task {
            let (imageData, _) = try await URLSession.shared.data(for: request)
            let image = UIImage(data: imageData)!
            return image
        }
        
        let image = try await task.value
        return image
    }
    
    func setupData () {
//            let json = try? JSONSerialization.jsonObject(with: data, options: [])
        
        
    }
    
}

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
