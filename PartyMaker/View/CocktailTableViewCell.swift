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
    
    var onReuse: () -> Void = {}
    
//    override func prepareForReuse() {
//      cellImageView.image = nil
//      cellImageView.cancelImageLoad()
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        onReuse()
        cocktailImage.image = nil
//        contentView.layer.cornerRadius = contentView.frame.size.height / 5
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
