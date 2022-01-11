//
//  CocktailDetailsViewController.swift
//  PartyMaker
//
//  Created by Victoria Nosik on 11.01.2022.
//

import UIKit

class CocktailDetailsViewController: UIViewController {
    var drink: Drink?
    
    @IBOutlet weak var cocktailTitle: UITextField!
    @IBOutlet weak var cocktailImage: UIImageView!
    
    @IBOutlet weak var totalNumber: UILabel!
    
    @IBOutlet weak var cocktailDescription: UITextField!
    
    @IBAction func numberOfCocktails(_ sender: UIStepper) {
    }
    
    @IBAction func metrics(_ sender: UISegmentedControl) {
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cocktailTitle.text = drink?.strDrink
        cocktailDescription.text = drink?.strInstructions
    }
    
//    func showDetails(drink: Drink) {
//
////        cocktailTitle.text = drink.strDrink
//////        cocktailImage.image = drink.strDrinkThumb
////        cocktailDescription.text = drink.strInstructions
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
