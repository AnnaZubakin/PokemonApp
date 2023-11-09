//
//  DetailViewController.swift
//  PokemonApp
//
//  Created by anna.zubakina on 09/11/2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonInfo: UILabel!
    
        
        var card: Card?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        
            if let selectedCard = card {
                    pokemonName.text = "Name: \(selectedCard.name)"
                pokemonInfo.text = "Types: \(selectedCard.types?.joined(separator: ", ") ?? "")\nSupertype: \(selectedCard.supertype ?? "")\nSubtype: \(selectedCard.subtype ?? "")\nArtist: \(selectedCard.artist ?? "")\nHP: \(selectedCard.hp ?? "")"
                    
                
                if let imageURL = URL(string: selectedCard.imageURL) {
                    DispatchQueue.global().async {
                        if let data = try? Data(contentsOf: imageURL) {
                            DispatchQueue.main.async {
                                self.pokemonImage.image = UIImage(data: data)
                            }
                        }
                    }
                }
                
            }
        }
        
        
    }
       

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


