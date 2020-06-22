//
//  CharacterCell.swift
//  home_work_10
//
//  Created by Юлия on 21.06.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var chatacterName: UILabel!
    @IBOutlet var characterFullName: UILabel!
    @IBOutlet var characterRace: UILabel!
    @IBOutlet var characterPower: UILabel!
    
    func configure(with character: Character) {
        chatacterName.text = "Name: " + (character.name ?? "")
        characterFullName.text = "Full-name: " + (character.biography.fullname ?? "")
        characterRace.text = "Race: " + (character.appearance.race ?? "")
        characterPower.text = "Power: " + (character.powerstats.power ?? "")
        
        DispatchQueue.global().async {
            guard let stringURL = character.image.url else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
            }
        }
    }
}
