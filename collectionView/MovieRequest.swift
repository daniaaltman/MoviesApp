//
//  MovieRequest.swift
//  collectionView
//
//  Created by Dania Altman on 07/04/2022.
//

import Foundation
class MovieRequest {
    
    
    
    func congifure() {
        httpRequest()
    }
    func httpRequest() {
        let token = "api_key=0cfd047bf8d2487c8c1b8e5a95ca5afd"
        let maniUrl = "https://api.themoviedb.org/3/"
        let popularity = "discover/movie?sort_by=popularity.desc&"
        let url = URL(string: "\(maniUrl)\(popularity)\(token)")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                error == nil,
                let data = data,
                let string = String(data: data, encoding: .utf8)
            else {
                print(error ?? "Unknown error")
                return
            }

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
