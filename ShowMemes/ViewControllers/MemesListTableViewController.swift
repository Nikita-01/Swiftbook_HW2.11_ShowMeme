//
//  MemesListTableViewController.swift
//  ShowMemes
//
//  Created by Никита Рыжкин on 01.12.2021.
//

import UIKit

class MemesListTableViewController: UITableViewController {
    
    private var memes: [MemeInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: Link.memesApi.rawValue)
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "meme", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let meme = memes[indexPath.row]
        
        content.text = meme.name
        content.secondaryText = "\(meme.width) * \(meme.height)"
        cell.contentConfiguration = content
        
        return cell
    }



    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let memeVC = segue.destination as? MemeViewController else { return }
            memeVC.memeImageUrl = memes[indexPath.row].url
        }
    }

    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchMemes(from: url) { memesData in
            self.memes = memesData.data.memes
            self.tableView.reloadData()
        }
        
    }
}
