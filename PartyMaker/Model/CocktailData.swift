//
//  CocktailData.swift
//  PartyMaker
//
//  Created by Victoria Nosik on 08.01.2022.
//

import Foundation

struct CocktailData: Codable {
    
    let drinks: [Drink]
}

struct Drink: Codable {
    
    let strDrink: String
    
}
