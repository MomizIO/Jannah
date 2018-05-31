//
//  SliderCollectionViewCell.swift
//  Jannah
//
//  Created by Abdelaziz on 5/31/18.
//  Copyright © 2018 ABD EL AZIZ MOHAMED. All rights reserved.
//

import UIKit

class SliderCollectionViewCell: BaseCollectionViewCell {
    
    override var recipe: Recipe? {
        didSet{
            setupCell()
        }
    }
    
    override func setupCell(){
        super.setupCell()
        
        // Setup Image View Constrain
        imageView!.widthAnchor.constraint(equalToConstant: 200)
        imageView!.heightAnchor.constraint(equalToConstant: 200)
    }
    
}
