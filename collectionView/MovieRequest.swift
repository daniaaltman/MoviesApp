//
//  MovieRequest.swift
//  collectionView
//
//  Created by Dania Altman on 07/04/2022.
//

import Foundation

class MovieRequest {
    
    var currdata: Data?
    var movieData: [MovieData] = []
    
    enum requestType {
        case popularity
        case highestRated
        case popularKids
        
        
    }
    
    func selectType (type: requestType) -> String {
        switch type {
        case .popularity:
           return "discover/movie?sort_by=popularity.desc&"
        case .highestRated:
           return "/discover/movie/?certification_country=US&certification=R&sort_by=vote_average.desc&"
        case .popularKids:
           return "/discover/movie?certification_country=US&certification.lte=G&sort_by=popularity.desc&"
        }
    }
    
    
    func httpRequest(_ type: requestType) {
        let token = "api_key=0cfd047bf8d2487c8c1b8e5a95ca5afd"
        let maniUrl = "https://api.themoviedb.org/3/"
        let selectedType = selectType(type: type)
        let url = URL(string: "\(maniUrl)\(selectedType)\(token)")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                error == nil,
                let data = data,
                let string = String(data: data, encoding: .utf8)
                    
            else {
                print(error ?? "Unknown error")
                return
            }
            self.currdata = data

            print(string.data(using: .utf8)?.prettyPrintedJSONString ?? "no")
        }
        task.resume()
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
