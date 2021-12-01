//
//  ViewController.swift
//  ShowMemes
//
//  Created by Никита Рыжкин on 30.11.2021.
//

import UIKit

class MemeViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var memeImageUrl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        guard let memeImage = fetchImage(url: memeImageUrl) else { return }
        imageView.image = memeImage
    }
    
    private func fetchImage(url: String) -> UIImage? {
        guard let imageData = ImageManager.shared.fetchImage(from: url) else { return nil }
        guard let image = UIImage(data: imageData) else { return nil }
        activityIndicator.stopAnimating()
        return image
    }
    
}


