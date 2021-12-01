//
//  Meme.swift
//  ShowMemes
//
//  Created by Никита Рыжкин on 30.11.2021.
//

import Foundation

struct MemeInfo: Decodable {
    let name: String
    let url: String
    let width: Int
    let height: Int
}

struct Meme: Decodable {
    let memes: [MemeInfo]
}

struct DataMeme: Decodable {
    let data: Meme
}

enum Link: String {
    case memesApi = "https://api.imgflip.com/get_memes"
}
