//
//  NewsArticle.swift
//  mah445_FinalProject_Starter
//
//  Created by Mohammed Hussien on 5/13/20.
//  Copyright © 2020 Mohammed Hussien. All rights reserved.
//

import Foundation

struct NewsArticle: Codable {
    var abstract : String
    var snippet : String
    var web_url : String
    var lead_paragraph : String
//    var url : String
}

struct NewsArticlesObject: Codable {
    var docs: [NewsArticle]
}

struct NewsArticlesResponse: Codable {
    var response : NewsArticlesObject
}
