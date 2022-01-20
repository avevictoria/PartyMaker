//
//  CocktailTableViewCell.swift
//  PartyMaker
//
//  Created by Victoria Nosik on 08.01.2022.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cocktailTitle: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var mainIngridient: UILabel!
    
    var onReuse: () -> Void = {}
    
    override func prepareForReuse() {
        cocktailImage.image = nil
        cocktailImage.cancelImageLoad()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        onReuse()
        cocktailImage.image = nil
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
