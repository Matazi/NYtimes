//
//  NetworkManager.swift
//  mah445_FinalProject_Starter
//
//  Created by Mohammed Hussien on 5/13/20.
//  Copyright © 2020 Mohammed Hussien. All rights reserved.
//

import Foundation
import Alamofire

enum ExampleDataResponse<T: Any> {
    case success(data: T)
    case failure(error: Error)
}



class NetworkManager {

    private static let endpoint = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=G7wOmQt0qyCxJkPxXORJCjWxcVUUtldm"

    static func getNewsArticle(completion: @escaping (([NewsArticle]) -> Void)) {
        AF.request(endpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                print("we are in my guy")
                
                if let newsArticlesData = try? decoder.decode(NewsArticlesResponse.self, from: data) {
                    print("Where are we")
                    completion(newsArticlesData.response.docs)
                    print("worked or not?")
                }
                else{
                    print("oops")
                }
            case .failure(let error):
                print("since when")
                print(error.localizedDescription)
            }
        }
    }
}
