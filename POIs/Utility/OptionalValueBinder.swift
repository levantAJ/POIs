//
//  OptionalValueBinder.swift
//  POIs
//
//  Created by levantAJ on 20/10/18.
//  Copyright © 2018 levantAJ. All rights reserved.
//

struct OptionalValueBinder<ValueType> {
    private var didSetValue = false
    
    var value: ValueType? {
        didSet {
            didSetValue = true
            valueChanged?(value)
        }
    }
    
    var valueChanged: ((ValueType?) -> Void)? {
        didSet {
            guard didSetValue else { return }
            valueChanged?(value)
        }
    }
}
