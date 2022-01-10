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

    func tapped() {
//        let naviga
        let viewController = UIViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        tableView.rowHeight = 80.0
        title = "PartyMaker"
        tableView.register(UINib(nibName: "CocktailTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        manager.delegate = self
        manager.getCocktail()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfCocktails.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CocktailTableViewCell
        cell.cocktailTitle.text = listOfCocktails[indexPath.row].strDrink

        return cell
    }
   
}

extension CocktailsTableViewController: CocktailManagerDelegate {
    func didUpdateName(drinks: [Drink]) {
        listOfCocktails = drinks
        print(listOfCocktails)
        print(listOfCocktails[0].strDrink)
        tableView.reloadData()
    }

    func didFailWithError(error: Error) {
        print(error)
    }
    
//    func didTappedDetails() {
//        le
//        self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
//    }
}


