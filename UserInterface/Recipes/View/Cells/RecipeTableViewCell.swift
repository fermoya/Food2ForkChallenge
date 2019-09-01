//
//  RecipeTableViewCell.swift
//  UserInterface
//
//  Created by Fernando Moya de Rivas on 01/09/2019.
//  Copyright © 2019 Fernando Moya de Rivas. All rights reserved.
//

import UIKit
import Domain
import Kingfisher

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var recipe: Recipe! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        if let url = URL(string: recipe.imageUrl) {
            thumbnailImageView.kf.setImage(with: url)
        }
        
        titleLabel.text = recipe.title
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
}
