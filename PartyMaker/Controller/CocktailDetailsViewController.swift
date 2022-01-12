//
//  CocktailDetailsViewController.swift
//  PartyMaker
//
//  Created by Victoria Nosik on 11.01.2022.
//

import UIKit

class CocktailDetailsViewController: UIViewController {
    
    var drink: Drink?
    
    @IBOutlet weak var cocktailTitle: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var totalNumber: UILabel!
    @IBOutlet weak var cocktailDescription: UILabel!
    @IBOutlet weak var cocktailBackgroud: UILabel!
    @IBOutlet weak var numberOfCocktails: UILabel!
    override func viewDidLoad() {
        
        cocktailTitle.text = drink?.strDrink
        cocktailDescription.text = drink?.strInstructions
//        cocktailTitle.layer.cornerRadius = cocktailTitle.frame.size.height / 5
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    @IBAction func numberOfCocktails(_ sender: UIStepper) {
    }
    
    @IBAction func metrics(_ sender: UISegmentedControl) {
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
    }

}
