//
//  CharacterTableViewController.swift
//  home_work_10
//
//  Created by Юлия on 21.06.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    
    var characters: [Character] = []
    var character: Character!
    
    let jsons = ["https://www.superheroapi.com/api.php/3248807031852027/516", "https://www.superheroapi.com/api.php/3248807031852027/63", "https://www.superheroapi.com/api.php/3248807031852027/317", "https://www.superheroapi.com/api.php/3248807031852027/344"]
    
    
    override func viewDidLoad() {
        tableView.rowHeight = 550
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterCell
        
        let character = characters[indexPath.row]
        cell.configure(with: character)
        return cell
        
    }
    
    func fetchData() {
        
        for json in jsons {
            
            guard let url = URL(string: json) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { return }
                
                let decoder = JSONDecoder()
                
                do {
                    
                    self.character = try decoder.decode(Character.self, from: data)
                    self.characters.append(self.character)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }
}
    

