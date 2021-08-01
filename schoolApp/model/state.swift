//
//  state.swift
//  schoolApp
//
//  Created by mac on 07/07/2021.
//

import Foundation
import MapKit

struct States {
    var code:String
    var name:String
    var Latitude:Double
    var Longitude:Double
}

struct Gender {
    var code:String
    var name:String
}

struct SchoolType {
    var code:String
    var name:String
}


struct SchoolData{
    var school_name:String
    var school_type:String
    var school_gender:String
    var school_location:String
    var coordinate:CLLocationCoordinate2D
}
