//
//  model.swift
//  SwiftUI Practice
//
//  Created by Ethan  Xu on 3/11/21.
//

import Foundation

//ObservableObject tells Swift that we want to build bindings to instances of this type
class Values: ObservableObject {
    @Published var maxVal: Int = 5
    //@Published tells swift that anything that is refering to this property should be updated when it changes
    func setMax(_ v: Int) {
        if v > 1 {
            maxVal = v
        }
    }
}
