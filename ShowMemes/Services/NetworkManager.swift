//
//  NetworkManager.swift
//  ShowMemes
//
//  Created by Никита Рыжкин on 30.11.2021.
//

import Foundation


let url = "https://api.imgflip.com/get_memes"

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchMemes(from url: String?, with complition: @escaping(DataMeme) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let memesData = try JSONDecoder().decode(DataMeme.self, from: data)
                DispatchQueue.main.async {
                    complition(memesData)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}

class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}
