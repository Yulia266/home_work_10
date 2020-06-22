//
//  ViewController.swift
//  home_work_10
//
//  Created by Юлия on 21.06.2020.
//  Copyright © 2020 Юлия. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharacter" {
            let characterVC = segue.destination as! CharacterTableViewController
            characterVC.fetchData()
    
        }
    }
}
