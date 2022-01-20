//
//  CocktailDetailsViewController.swift
//  PartyMaker
//
//  Created by Victoria Nosik on 11.01.2022.
//

import UIKit

class CocktailDetailsViewController: UIViewController {
    
    var drink: Drink?
    var cocktailPicture: UIImage?
    var quantity: Int = 0
    var choosedMetrics: String?
    var ingridientsList = "Ingridients: \n \n"
    var measures = " \n \n"
    var backgroundImageName = "background"
    var requestDrinkDetails = false
    
    @IBOutlet weak var cocktailTitle: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var listOfCocktailsIngidients: UILabel!
    @IBOutlet weak var cocktailDescription: UILabel!
    @IBOutlet weak var measuresToIngridients: UILabel!
    //    переделать quantityOfCocktails на user interaction
    @IBOutlet weak var quantityOfCocktails: UILabel!
    
    @IBOutlet weak var cocktailBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBackgroundImage()
        loadCocktailInfo()


    }
    
    @IBAction func numberOfCocktails(_ sender: UIStepper) {
        quantity = Int(sender.value)
        quantityOfCocktails.text = "\(quantity)"
    }
    
    @IBAction func metrics(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
    }
    
    func loadBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: backgroundImageName)
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    func loadCocktailInfo() {
        cocktailBackground.layer.cornerRadius = cocktailBackground.frame.size.height / 10
        cocktailTitle.layer.masksToBounds = true
        cocktailTitle.layer.cornerRadius = cocktailTitle.frame.size.height / 4
        
        cocktailTitle.text = drink?.name
        cocktailImage.image = cocktailPicture
        cocktailDescription.text = drink?.strInstructions
        
        if let choosenDrink = drink {
            for ingridient in choosenDrink.ingridients {
                    ingridientsList.append("\(ingridient) \n")
                    print(ingridientsList)
            }
            for measure in choosenDrink.measures {
                measures.append("\(measure) \n")
            }
            if requestDrinkDetails {
                runRequestDrinkDetails(id: choosenDrink.idDrink)
            }
        }
        listOfCocktailsIngidients.text = ingridientsList
        measuresToIngridients.text = measures
        print(measures)
    }
    func runRequestDrinkDetails(id: String) {
        
    }
    
}

