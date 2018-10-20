//
//  UIView.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

import UIKit

extension UIView {
    static func load<T: UIView>(type: T.Type) -> T {
        let nibName = String(describing: type.self)
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as! T
    }
}
