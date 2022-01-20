//
//  ListOfAllCocktails.swift
//  PartyMaker
//
//  Created by Victoria Nosik on 18.01.2022.
//

import UIKit

class AllCocktailsTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var listOfCocktails = [Drink]()
    var filteredListOfCocktails = [Drink]()
    var cocktailsToShow = [Drink]()
    var manager = CocktailManager()
    var loader = ImageLoader()
    var link = "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?a=Alcoholic"
//    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        tableView.register(UINib(nibName: "CocktailTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        searchBar.delegate = self
        manager.delegate = self
        manager.getCocktail(link: link)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cocktailsToShow.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CocktailTableViewCell
        
        cell.cocktailTitle.text = cocktailsToShow[indexPath.row].name
        cell.mainIngridient.text = ""
        
        if let imageUrl = URL(string: cocktailsToShow[indexPath.row].drinkImageLink) {
            cell.cocktailImage.loadImage(at: imageUrl)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cocktailDetails = CocktailDetailsViewController.loadFromNib()
        
        let choosedCockatail = cocktailsToShow[indexPath.row]
        cocktailDetails.drink = choosedCockatail
        
        let cell = tableView.cellForRow(at: indexPath) as! CocktailTableViewCell
        cocktailDetails.cocktailPicture = cell.cocktailImage.image
        
        cocktailDetails.backgroundImageName = "allcocktails"
        cocktailDetails.requestDrinkDetails = true
        navigationController?.pushViewController(cocktailDetails, animated: true)
    }
    func setBackground() {
        title = "All Cocktails"
        tableView.backgroundView = UIImageView(image: UIImage(named: "allcocktails"))
        tableView.backgroundView?.alpha = 0.4
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
                cocktailsToShow = listOfCocktails
                tableView.reloadData()
                return
            }
        
        filteredListOfCocktails = listOfCocktails.filter({ (Drink) -> Bool in
           Drink.name.lowercased().contains(searchText.lowercased())
            
    })
       cocktailsToShow = filteredListOfCocktails
       searchBar.setShowsCancelButton(true, animated: true)
       tableView.reloadData()
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.searchTextField.text = ""
        cocktailsToShow = listOfCocktails
        tableView.reloadData()
    }
}

extension AllCocktailsTableViewController: CocktailManagerDelegate {
    func didUpdateName(drinks: [Drink]) {
        
        listOfCocktails = drinks
        cocktailsToShow = drinks
        tableView.reloadData()
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

