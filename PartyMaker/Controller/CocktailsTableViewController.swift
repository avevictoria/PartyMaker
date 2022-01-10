//
//  CocktailsTableViewController.swift
//  PartyMaker
//
//  Created by Victoria Nosik on 08.01.2022.
//

import UIKit

class CocktailsTableViewController: UITableViewController {
    var currentCocktail: String = ""
    var manager = CocktailManager()
//    var popularCocktails = [CocktailModel]()
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

    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CocktailTableViewCell
        cell.cocktailTitle.text = currentCocktail
        
        return cell
    }
   
}

extension CocktailsTableViewController: CocktailManagerDelegate {
    func didUpdateName(model: CocktailModel) {
        currentCocktail = model.name
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


