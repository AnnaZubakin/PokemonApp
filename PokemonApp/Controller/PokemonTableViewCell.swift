//
//  PokemonTableViewCell.swift
//  PokemonApp
//
//  Created by anna.zubakina on 06/11/2023.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
 /*   @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    
    func configure(with movie: Movie) {
           movieImageView.image = UIImage(named: movie.imageNames)
           movieLabel.text = movie.movieTitles
           yearLabel.text = "\(movie.releaseYears)"
           genresLabel.text = movie.movieGenres
       } */

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
