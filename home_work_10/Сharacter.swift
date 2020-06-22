//
//  Сharacter.swift
//  home_work_10
//
//  Created by Юлия on 21.06.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

struct Powerstats: Decodable {
    let power: String?
}

struct Biography: Decodable {
    let fullname: String?
    
    enum CodingKeys: String, CodingKey {
        case fullname = "full-name"
    }
}

struct Appearance: Decodable {
    let race: String?
}

struct Image: Decodable {
    let url: String?
}

struct Character: Decodable {
    let name: String?
    let powerstats: Powerstats
    let biography: Biography
    let appearance: Appearance
    let image: Image
}




