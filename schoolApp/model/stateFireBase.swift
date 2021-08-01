//
//  stateFireBase.swift
//  schoolApp
//
//  Created by mac on 07/07/2021.
//

import Foundation
import FirebaseFirestore
import MapKit
extension States {
    static func build(from documents: [QueryDocumentSnapshot]) -> [States] {
        var state = [States]()
        for document in documents {
            state.append(
                States(code: document["code"] as? String ?? "", name: document["name"] as? String ?? "" ,Latitude: document["Latitude"] as? Double ?? 0.0 ,Longitude:document["Longitude"] as? Double ?? 0.0 ))
        }
        return state
    }
}
extension Gender{
    
    static func build(from documents: [QueryDocumentSnapshot]) -> [Gender] {
        var gender = [Gender]()
        for document in documents {
            gender.append(Gender( code:document["code"] as? String ?? "", name: document["name"] as? String ?? ""))
        }
    
        return gender
    }
    
}
extension SchoolType{
    
    static func build(from documents: [QueryDocumentSnapshot]) -> [SchoolType] {
        var school = [SchoolType]()
        for document in documents {
            school.append(SchoolType(code: document["code"] as? String ?? "", name: document["name"] as? String ?? ""))
        }
    
        return school
    }
    
}
extension SchoolData{
    
    static func build(from documents: [QueryDocumentSnapshot]) -> [SchoolData] {
        var schoolData = [SchoolData]()
        for document in documents {
            schoolData.append(SchoolData(
                                school_name: document["school_name"] as? String ?? "",
                                school_type: document["school_type"] as? String ?? "",
                                school_gender: document["school_gender"] as? String ?? "",
                                school_location: document["school_location"] as? String ?? "",
                                coordinate:CLLocationCoordinate2D(latitude: document["lat"] as! Double, longitude: document["long"] as! Double)))
        }
    
        return schoolData
    }
    
}
