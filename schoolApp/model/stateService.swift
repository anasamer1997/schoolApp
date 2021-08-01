//
//  stateService.swift
//  schoolApp
//
//  Created by mac on 07/07/2021.
//

import FirebaseFirestore

class StateService {
    let database = Firestore.firestore()
    
    func getStates(collectionID: String, handler: @escaping ([States]) -> Void) {
        database.collection(collectionID)
            .addSnapshotListener { querySnapshot, err in
                if let error = err {
                    print(error)
                    handler([])
                } else {
                    handler(States.build(from: querySnapshot?.documents ?? []))
                }
            }
    }
    
    func getGender(collectionID: String, handler: @escaping ([Gender]) -> Void) {
        database.collection(collectionID)
            .addSnapshotListener { querySnapshot, err in
                if let error = err {
                    print(error)
                    handler([])
                } else {
                    handler(Gender.build(from: querySnapshot?.documents ?? []))
                }
            }
    }
    
    func getSchool(collectionID: String, handler: @escaping ([SchoolType]) -> Void) {
        database.collection(collectionID)
            .addSnapshotListener { querySnapshot, err in
                if let error = err {
                    print(error)
                    handler([])
                } else {
                    handler(SchoolType.build(from: querySnapshot?.documents ?? []))
                }
            }
    }
    
    func getSchoolData(collectionID: String,state:String,gender:String,type:String,handler: @escaping ([SchoolData]) -> Void) {
        database.collection(collectionID).whereField("school_location", isEqualTo: state)
            .whereField("school_type", isEqualTo: type)
            .whereField("school_gender", isEqualTo: gender)
            .addSnapshotListener { querySnapshot, err in
                if let error = err {
                    print(error)
                    handler([])
                } else {
                    handler(SchoolData.build(from: querySnapshot?.documents ?? []))
                }
            }
    }
    
    
}
