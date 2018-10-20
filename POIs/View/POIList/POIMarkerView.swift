//
//  POIMarkerView.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import UIKit

final class POIMarkerView: UIView {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var icon: UIImage? {
        didSet {
            imageView.image = icon
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.borderWidth = 0.5
        backgroundView.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
    }
}

// MARK: - Factorable

extension POIMarkerView: Factorable {
    static func create() -> POIMarkerView {
        return load(type: POIMarkerView.self)
    }
}
