//
//  CocktailData.swift
//  PartyMaker
//
//  Created by Victoria Nosik on 08.01.2022.
//

import Foundation

struct CocktailData: Decodable {
    
    let drinks: [Drink]
}

struct Drink: Decodable {
    
    let name: String
    let drinkImageLink: String
    let strInstructions: String
    let ingridients: [String]
    let measures: [String]
    
    enum CodingKeys: String, CodingKey {
        
        case name = "strDrink"
        case drinkImageLink = "strDrinkThumb"
        case instructions = "strInstructions"
        case ingridient1 = "strIngredient1"
        case ingridient2 = "strIngredient2"
        case ingridient3 = "strIngredient3"
        case ingridient4 = "strIngredient4"
        case ingridient5 = "strIngredient5"
        case ingridient6 = "strIngredient6"
        case ingridient7 = "strIngredient7"
        case ingridient8 = "strIngredient8"
        case ingridient9 = "strIngredient9"
        case ingridient10 = "strIngredient10"
        case ingridient11 = "strIngredient11"
        case ingridient12 = "strIngredient12"
        case ingridient13 = "strIngredient13"
        case ingridient14 = "strIngredient14"
        case ingridient15 = "strIngredient15"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        drinkImageLink = (try? values.decode(String.self, forKey: .drinkImageLink)) ?? ""
        strInstructions = (try? values.decode(String.self, forKey: .instructions)) ?? ""
        
        var ingridientsLocal: [String] = []
        var measuresLocal: [String] = []
        
        let ingridient1 = (try? values.decode(String.self, forKey: .ingridient1)) ?? ""
        let measure1 = (try? values.decode(String.self, forKey: .measure1)) ?? ""
        if ingridient1 != "", measure1 != "" {
            ingridientsLocal.append(ingridient1)
            measuresLocal.append(measure1)
        }
        
        let ingridient2 = (try? values.decode(String.self, forKey: .ingridient2)) ?? ""
        let measure2 = (try? values.decode(String.self, forKey: .measure2)) ?? ""
        if ingridient2 != "", measure2 != "" {
            ingridientsLocal.append(ingridient2)
            measuresLocal.append(measure2)
        }
        
        let ingridient3 = (try? values.decode(String.self, forKey: .ingridient3)) ?? ""
        let measure3 = (try? values.decode(String.self, forKey: .measure3)) ?? ""
        if ingridient3 != "", measure3 != "" {
            ingridientsLocal.append(ingridient3)
            measuresLocal.append(measure3)
        }
        
        let ingridient4 = (try? values.decode(String.self, forKey: .ingridient4)) ?? ""
        let measure4 = (try? values.decode(String.self, forKey: .measure4)) ?? ""
        if ingridient4 != "", measure4 != "" {
            ingridientsLocal.append(ingridient4)
            measuresLocal.append(measure4)
        }
        
        let ingridient5 = (try? values.decode(String.self, forKey: .ingridient5)) ?? ""
        let measure5 = (try? values.decode(String.self, forKey: .measure5)) ?? ""
        if ingridient5 != "", measure5 != "" {
            ingridientsLocal.append(ingridient5)
            measuresLocal.append(measure5)
        }
        
        let ingridient6 = (try? values.decode(String.self, forKey: .ingridient6)) ?? ""
        let measure6 = (try? values.decode(String.self, forKey: .measure6)) ?? ""
        if ingridient6 != "", measure6 != "" {
            ingridientsLocal.append(ingridient6)
            measuresLocal.append(measure6)
        }
        
        let ingridient7 = (try? values.decode(String.self, forKey: .ingridient7)) ?? ""
        let measure7 = (try? values.decode(String.self, forKey: .measure7)) ?? ""
        if ingridient7 != "", measure7 != "" {
            ingridientsLocal.append(ingridient7)
            measuresLocal.append(measure7)
        }
        
        let ingridient8 = (try? values.decode(String.self, forKey: .ingridient8)) ?? ""
        let measure8 = (try? values.decode(String.self, forKey: .measure8)) ?? ""
        if ingridient8 != "", measure8 != "" {
            ingridientsLocal.append(ingridient8)
            measuresLocal.append(measure8)
        }
        
        let ingridient9 = (try? values.decode(String.self, forKey: .ingridient9)) ?? ""
        let measure9 = (try? values.decode(String.self, forKey: .measure9)) ?? ""
        if ingridient9 != "", measure9 != "" {
            ingridientsLocal.append(ingridient9)
            measuresLocal.append(measure9)
        }
        
        let ingridient10 = (try? values.decode(String.self, forKey: .ingridient10)) ?? ""
        let measure10 = (try? values.decode(String.self, forKey: .measure10)) ?? ""
        if ingridient10 != "", measure10 != "" {
            ingridientsLocal.append(ingridient10)
            measuresLocal.append(measure10)
        }
        
        let ingridient11 = (try? values.decode(String.self, forKey: .ingridient11)) ?? ""
        let measure11 = (try? values.decode(String.self, forKey: .measure11)) ?? ""
        if ingridient11 != "", measure11 != "" {
            ingridientsLocal.append(ingridient11)
            measuresLocal.append(measure11)
        }
        
        let ingridient12 = (try? values.decode(String.self, forKey: .ingridient12)) ?? ""
        let measure12 = (try? values.decode(String.self, forKey: .measure12)) ?? ""
        if ingridient12 != "", measure12 != "" {
            ingridientsLocal.append(ingridient12)
            measuresLocal.append(measure12)
        }
        
        let ingridient13 = (try? values.decode(String.self, forKey: .ingridient13)) ?? ""
        let measure13 = (try? values.decode(String.self, forKey: .measure13)) ?? ""
        if ingridient13 != "", measure13 != "" {
            ingridientsLocal.append(ingridient13)
            measuresLocal.append(measure13)
        }
        
        let ingridient14 = (try? values.decode(String.self, forKey: .ingridient14)) ?? ""
        let measure14 = (try? values.decode(String.self, forKey: .measure14)) ?? ""
        if ingridient14 != "", measure14 != "" {
            ingridientsLocal.append(ingridient14)
            measuresLocal.append(measure14)
        }
        
        let ingridient15 = (try? values.decode(String.self, forKey: .ingridient15)) ?? ""
        let measure15 = (try? values.decode(String.self, forKey: .measure15)) ?? ""
        if ingridient15 != "", measure15 != "" {
            ingridientsLocal.append(ingridient15)
            measuresLocal.append(measure15)
        }
        
        ingridients = ingridientsLocal
        measures = measuresLocal
    }
}

