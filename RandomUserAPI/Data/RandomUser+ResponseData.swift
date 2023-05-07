//
//  RandomUser+ResponseData.swift
//  RandomUserAPI
//
//  Created by 최동현 on 2023/05/07.
//

import Foundation


struct RandomUser: Codable, Identifiable, CustomStringConvertible {
    
    var id = UUID()
    var name: Name
    var picture: Photo
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case picture = "picture"
    }
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return RandomUser(name: Name.getDummy(), picture: Photo.getDummy())
    }
    
    var profileImgUrl: URL {
        get {
            URL(string: picture.medium)!
        }
    }
    
    var description: String {
        return name.description
    }
}

struct Name: Codable {
    var title: String
    var first: String
    var last: String
    
    var description: String {
        return "[\(title)] \(last), \(first)"
    }
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Name(title: "유튜버", first: "동현", last: "최")
    }
}


struct Photo: Codable {
    var large: String
    var medium: String
    var thumbnail: String
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Photo(large: "https://randomuser.me/api/portraits/women/27.jpg", medium: "https://randomuser.me/api/portraits/women/27.jpg", thumbnail: "https://randomuser.me/api/portraits/women/27.jpg")
    }
}

struct Info: Codable {
    var seed: String
    var resultsCount: Int
    var page: Int
    var version: String
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResponse: Codable, CustomStringConvertible {
    var results: [RandomUser]
    var info: Info
    
    private enum CodingKeys: String, CodingKey {
        case results, info
    }
    
    var description: String {
        return "results.count: \(results.count) / info : \(info.seed)"
    }
}
