//
//  ViewController.swift
//  PokemonApp
//
//  Created by anna.zubakina on 06/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

 
    @IBOutlet weak var pokemonTableView: UITableView!
    
    var pokey:[Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
       // loadPokemonData(completion: <#() -> Void#>)
        loadPokemonData {
               DispatchQueue.main.async {
                   self.pokemonTableView.reloadData()
               }
           }
    }
    
    func loadPokemonData(completion: @escaping () -> Void){
        let jsonUrl = "https://api.pokemontcg.io/v1/cards"
        guard let url = URL(string:jsonUrl) else { return }
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request){
            data,response,error in
            if error != nil{
                print((error?.localizedDescription)!)
            }
            dump(response)
            
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do{
                let jsonData = try JSONDecoder().decode(Pokemon.self,from:data)
                dump(jsonData)
                self.pokey = jsonData.cards
                
                completion()
                
            }catch{
                print("error::::",error)
            }
        }.resume()
        self.pokemonTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return pokey.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //   print("Configre cell for")
            let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
            let pokemon = pokey[indexPath.row]
            cell.configure(with: pokemon)
            return cell
            }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }

        }





