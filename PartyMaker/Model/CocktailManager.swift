//
//  CocktailManager.swift
//  PartyMaker
//
//  Created by Victoria Nosik on 08.01.2022.
//

import Foundation

protocol CocktailManagerDelegate {
    func didUpdateName(drinks: [Drink])
    func didFailWithError(error: Error)
}

struct CocktailManager {
    
    var delegate: CocktailManagerDelegate?
    
    var link1 = "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?a=Alcoholic"
    var link2 = "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?a=Alcoholic"
    
    func getRandomCocktails() {
        
    }
    
    func getAllCoctails() {
        
    }
    
    func getCocktail(link: String) {
        
        let cocktailURL = link
        
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
                            self.delegate?.didUpdateName(drinks: cocktailInfo)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> [Drink]? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CocktailData.self, from: data)
            let cocktails = decodedData.drinks
            return cocktails
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
