//
//  service.swift
//  schoolApp
//
//  Created by mac on 07/07/2021.
//

import Foundation
import FirebaseFirestore




// i use this class just to uploade data to fiebase very quick
class Request{
    
    static let shared = Request()
   
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    
    
    func addStates(){
//
//        ref = db.collection("states").addDocument(data: ["code":"ab","name":"Al-Baha"]) //,"coordinates":[125.12354,12.265]])
//        ref = db.collection("states").addDocument(data: ["code":"ar","name" : "Arar"])
//        ref = db.collection("states").addDocument(data: ["code":"bu","name" : "Buraidah"])
//        ref = db.collection("states").addDocument(data: ["code":"ha","name" : "Hail"])
//        ref = db.collection("states").addDocument(data: ["code":"ja","name" : "Jazan"])
//        ref = db.collection("states").addDocument(data: ["code":"mad","name" : "Madinah"])
//        ref = db.collection("states").addDocument(data: ["code":"mak","name" : "Makkah"])
//        ref = db.collection("states").addDocument(data: ["code":"ri","name" : "Riyadh"])
//        ref = db.collection("states").addDocument(data: ["code":"sak","name" : "Sakaka"])
//        ref = db.collection("states").addDocument(data: ["code":"ta","name" : "Tabuk"])
//        ref = db.collection("states").addDocument(data: ["code":"dam","name" : "Dammam"])
//        ref = db.collection("states").addDocument(data: ["code":"naj","name" : "Najran"])
        // modefied
    ref = db.collection("states").addDocument(data: ["code":"ab","name":"Al-Baha","Latitude":20.01288 ,"Longitude":41.46767])
    ref = db.collection("states").addDocument(data: ["code":"ar","name" : "Arar","Latitude":30.97531 ,"Longitude":41.03808])
    ref = db.collection("states").addDocument(data: ["code":"bu","name" : "Buraidah","Latitude":26.32599,"Longitude":43.97497])
    ref = db.collection("states").addDocument(data: ["code":"ha","name" : "Hail","Latitude":27.52188,"Longitude":41.69073])
    ref = db.collection("states").addDocument(data: ["code":"ja","name" : "Jazan","Latitude":16.88917,"Longitude":42.55111])
    ref = db.collection("states").addDocument(data: ["code":"mad","name" : "Madinah","Latitude":24.46861,"Longitude":39.61417])
    ref = db.collection("states").addDocument(data: ["code":"mak","name" : "Makkah","Latitude":21.42664,"Longitude":39.82563])
    ref = db.collection("states").addDocument(data: ["code":"ri","name" : "Riyadh","Latitude":24.68773,"Longitude":46.72185])
    ref = db.collection("states").addDocument(data: ["code":"sak","name" : "Sakakah","Latitude":29.96974,"Longitude":40.20641])
    ref = db.collection("states").addDocument(data: ["code":"ta","name" : "Tabuk","Latitude":28.3998,"Longitude":36.57151])
    ref = db.collection("states").addDocument(data: ["code":"dam","name" : "Dammam","Latitude":26.43442,"Longitude":50.10326])
    ref = db.collection("states").addDocument(data: ["code":"naj","name" : "Najran","Latitude":17.49326,"Longitude":44.12766])
    }
    
    func addGenderToFireBase(){
        ref = db.collection("gender").addDocument(data: ["code":"f","name" : "Female"])
        ref = db.collection("gender").addDocument(data: ["code":"m","name" : "Male"])
    }
    
    func addSchoolTypeToFireBase(){
        ref = db.collection("schoolType").addDocument(data: ["code":"i","name" : "International"])
        ref = db.collection("schoolType").addDocument(data: ["code":"g","name" : "governmental"])
        ref = db.collection("schoolType").addDocument(data: ["code":"p","name" : "Private"])
    }
    
    
    func schoolDataFromFireBase(){
        
//        ref = db.collection("Schools").addDocument(
//            data: ["school_name":"A","school_location" : "Al-Baha" ,"school_type":"International","school_gender":"Male"])
//        ref = db.collection("Schools").addDocument(
//            data: ["school_name":"B","school_location" : "Al-Baha","school_type":"International","school_gender":"Female"])
//        ref = db.collection("Schools").addDocument(
//            data: ["school_name":"T","school_location" : "Al-Baha","school_type":"International","school_gender":"Female"])
//        ref = db.collection("Schools").addDocument(
//            data: ["school_name":"C","school_location" : "Arar","school_type":"International","school_gender":"Male"])
//        ref = db.collection("Schools").addDocument(
//            data: ["school_name":"D","school_location" : "Arar","school_type":"governmental","school_gender":"Male"])
//        ref = db.collection("Schools").addDocument(
//            data: ["school_name":"E","school_location" : "Jazan","school_type":"governmental","school_gender":"Female"])
//        ref = db.collection("Schools").addDocument(
//            data: ["school_name":"F","school_location" : "Tabuk","school_type":"International","school_gender":"Male"])
//        ref = db.collection("Schools").addDocument(
//            data: ["school_name":"G","school_location" : "Al-Baha","school_type":"International","school_gender":"Female"])
        
        
        // test mode
        ref = db.collection("Schools").addDocument(
            data: ["school_name":"A","school_location" : "Riyadh" ,"school_type":"International","school_gender":"Male",
                   "lat":24.781318740604682 , "long":46.82407379150390])
        ref = db.collection("Schools").addDocument(
            data: ["school_name":"B","school_location" : "Riyadh","school_type":"governmental","school_gender":"Male",
                   "lat":24.77512339741956 , "long":46.812615394592285])
        ref = db.collection("Schools").addDocument(
            data: ["school_name":"T","school_location" : "Riyadh","school_type":"Private","school_gender":"Male",
                   "lat":24.770135726681467 , "long":46.82682037353515])
        ref = db.collection("Schools").addDocument(
            data: ["school_name":"C","school_location" : "Riyadh","school_type":"International","school_gender":"Female",
                   "lat":24.762108273409947 , "long":46.76433563232421])
        ref = db.collection("Schools").addDocument(
            data: ["school_name":"D","school_location" : "Riyadh","school_type":"governmental","school_gender":"Female",
                   "lat":24.73311159823193 , "long":46.78733825683594])
        ref = db.collection("Schools").addDocument(
            data: ["school_name":"E","school_location" : "Riyadh","school_type":"Private","school_gender":"Female",
                   "lat":24.78782546618223 , "long":46.78184509277344])
        ref = db.collection("Schools").addDocument(
            data: ["school_name":"F","school_location" : "Riyadh","school_type":"governmental","school_gender":"Male",
                   "lat":24.682585116816337 , "long":46.667518615722656])
        ref = db.collection("Schools").addDocument(
            data: ["school_name":"G","school_location" : "Riyadh","school_type":"International","school_gender":"Female",
                   "lat":24.712373270156043 , "long":46.65721893310547])
    }
}
