//
//  CocktailsTableViewController.swift
//  PartyMaker
//
//  Created by Victoria Nosik on 08.01.2022.
//

import UIKit

class CocktailsTableViewController: UITableViewController {
    
    var listOfCocktails = [Drink]()
    var manager = CocktailManager()
    var loader = ImageLoader()
    var link = "https://www.thecocktaildb.com/api/json/v2/9973533/randomselection.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        tableView.register(UINib(nibName: "CocktailTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        manager.delegate = self
        manager.getCocktail(link: link)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listOfCocktails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CocktailTableViewCell
        cell.cocktailTitle.text = listOfCocktails[indexPath.row].name
        cell.mainIngridient.text = listOfCocktails[indexPath.row].ingridients[0]
        
        if let imageUrl = URL(string: listOfCocktails[indexPath.row].drinkImageLink) {
            cell.cocktailImage.loadImage(at: imageUrl)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cocktailDetails = CocktailDetailsViewController.loadFromNib()
        
        self.navigationController?.pushViewController(cocktailDetails, animated: true)
        
        let choosedCockatail = listOfCocktails[indexPath.row]
        cocktailDetails.drink = choosedCockatail
        
        let cell = tableView.cellForRow(at: indexPath) as! CocktailTableViewCell
        cocktailDetails.cocktailPicture = cell.cocktailImage.image
        cocktailDetails.backgroundImageName = "background"
        
        cocktailDetails.requestDrinkDetails = false
    }
    func setBackground () {
        title = "Random Cocktails"
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        tableView.backgroundView?.alpha = 0.4
    }
}

extension CocktailsTableViewController: CocktailManagerDelegate {
    func didUpdateName(drinks: [Drink]) {
        listOfCocktails = drinks
        tableView.reloadData()
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

