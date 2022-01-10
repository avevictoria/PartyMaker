//
//  CocktailManager.swift
//  PartyMaker
//
//  Created by Victoria Nosik on 08.01.2022.
//

import Foundation

protocol CocktailManagerDelegate {
    func didUpdateName(model: CocktailModel)
    func didFailWithError(error: Error)
}




struct CocktailManager {
    
    var delegate: CocktailManagerDelegate?
    
    func getCocktail() {
//        9973533
        let cocktailURL = "https://www.thecocktaildb.com/api/json/v2/9973533/popular.php"
        
        if let url = URL(string: cocktailURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let cocktailInfo = self.parseJSON(safeData) {
                        DispatchQueue.main.async {
                            self.delegate?.didUpdateName(model: cocktailInfo)
                        }
                    }
                }
            }
            task.resume()
        }
    }
        
        func parseJSON(_ data: Data) -> CocktailModel? {
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(CocktailData.self, from: data)
                let name = decodedData.drinks[0].strDrink
                let cocktail = CocktailModel(name: name)
                return cocktail
                
            } catch {
                delegate?.didFailWithError(error: error)
                return nil
            }
        }
        
    }
