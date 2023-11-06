//
//  PokemonTableViewCell.swift
//  PokemonApp
//
//  Created by anna.zubakina on 06/11/2023.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with pokemon: Card) {
            nameLabel.text = pokemon.name

            if let imageURL = URL(string: pokemon.imageURL) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: imageURL) {
                        DispatchQueue.main.async {
                            self.pokemonImageView.image = UIImage(data: data)
                        }
                    }
                }
            }
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
