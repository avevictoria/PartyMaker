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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PartyMaker"
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        tableView.backgroundView?.alpha = 0.4
        tableView.register(UINib(nibName: "CocktailTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        manager.delegate = self
        manager.getCocktail()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listOfCocktails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CocktailTableViewCell
        cell.cocktailTitle.text = listOfCocktails[indexPath.row].strDrink
        //        cell.cocktailImage.setImageFromURl(ImageUrl: listOfCocktails[indexPath.row].strDrinkThumb)
        //        if let url = URL(string: listOfCocktails[indexPath.row].strDrinkThumb) {
        //            cell.cocktailImage.load(url: url)
        //        }
        if let imageUrl = URL(string: listOfCocktails[indexPath.row].strDrinkThumb) {
            let token = loader.loadImage(imageUrl) { result in
                do {
                    // 2
                    let image = try result.get()
                    // 3
                    DispatchQueue.main.async {
                        cell.cocktailImage.image = image
                    }
                } catch {
                    // 4
                    print(error)
                }
            }
            
            // 5
            cell.onReuse = {
                if let token = token {
                    self.loader.cancelLoad(token)
                }
            }
            
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cocktailDetails = CocktailDetailsViewController.loadFromNib()
        
        self.navigationController?.pushViewController(cocktailDetails, animated: true)
        let choosedCockatail = listOfCocktails[indexPath.row]
        cocktailDetails.drink = choosedCockatail
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

//extension UIImageView{
//
//     func setImageFromURl(ImageUrl: String){
//
//         if let url = NSURL(string: ImageUrl) {
//             if let imagedata = NSData(contentsOf: url as URL) {
//                 self.image = UIImage(data: imagedata as Data)
//             }
//         }
//     }
// }
//extension UIImageView {
//    func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}
