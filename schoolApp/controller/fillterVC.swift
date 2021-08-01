//
//  ViewController.swift
//  schoolApp
//
//  Created by mac on 04/07/2021.
//

import UIKit
import FirebaseFirestore
import DPPickerManager


class fillterVC: UIViewController {

    @IBOutlet weak var statesName: UIButton!
    @IBOutlet weak var genderType: UIButton!
    @IBOutlet weak var schoolType: UIButton!
    
    
    var stateSelected:States!
    var genderSelected:Gender!
    var schoolSelected:SchoolType!
    
    private var service: StateService?
    var State:[States]? = []
    var Gender:[Gender]? = []
    var School:[SchoolType]? = []
    var schoolData:[SchoolData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadState()
        
        //Request.shared.addState()
        //Request.shared.addGender()
       // Request.shared.addSchoolType()
        //Request.shared.schoolData()
    }
    
    
    //MARK:- IBOutlet
    func loadState() {
            service = StateService()
            service?.getStates(collectionID: "states") { statesData in
             self.State = statesData

            }
        print("states loadded...")
        }
    
    func loadGender() {
            service = StateService()
            service?.getGender(collectionID: "gender") { Gender in
                self.Gender = Gender
            }
        print("gender loadded...")
       
        }
    func loadSchoolType() {
            service = StateService()
            service?.getSchool(collectionID: "schoolType") { school in
                self.School = school
            }
        print("school loadded...")
       
        }
 
    
    //MARK:- IBAction
    @IBAction func showStatesTapped(_ sender: Any) {

        if (State!.count > 0 ){
            let state:[String] = (self.State?.compactMap{$0.name})!
            
            if state.count != 0{
                
            DPPickerManager.shared.showPicker(title: "اختار المنطقة", selected:  state[0], strings:state) { value, index, cancel in
                 if !cancel{
                               
                        if let val = value{
                                  
                            self.genderSelected = nil
                            self.schoolSelected = nil
                            self.statesName.setTitle(val, for: .normal)
                                    
                            self.genderType.setTitle("اختار الجنس", for: .normal)
                                    
                            self.schoolType.setTitle("اختار نوع المدرسة", for: .normal)
                                    
                            self.State!.forEach ({ (state:States) in
                                       
                                if (state.name == val){
                                    self.stateSelected = state
                                   
                                    self.Gender?.removeAll()
                                    self.loadGender()
                                }
                            })
                          
                        

                    }
                }
                        }
                
            }
        }
    }
    
    
    @IBAction func genderTapped(_ sender: Any) {
        
        if (Gender!.count > 0 ){
            let gender:[String] = (self.Gender?.compactMap{$0.name})!
            
            if gender.count != 0{
                
            DPPickerManager.shared.showPicker(title: "اختار الجنس ", selected:  gender[0], strings:gender) { value, index, cancel in
         
                    if !cancel{
                               
                        if let val = value{
                                  
                            self.schoolSelected = nil
                            self.genderType.setTitle(val, for: .normal)
                            self.schoolType.setTitle("اختار نوع المدرسة", for: .normal)
                            self.Gender!.forEach ({ (gender:Gender) in
                                if (gender.name == val){
                                    self.genderSelected = gender
                                    self.School?.removeAll()
                                    self.loadSchoolType()
                                }
                            })

                    }
                }
                        }
                
            }
        }
    }
    
    
    @IBAction func schoolTypeTapped(_ sender: Any) {
        
        if (School!.count > 0 ){
            let school:[String] = (self.School?.compactMap{$0.name})!
            
            if school.count != 0{
                
            DPPickerManager.shared.showPicker(title: "اختار نوع المدرسة   ", selected:  school[0], strings:school) { value, index, cancel in
         
                    if !cancel{
                        if let val = value{
                            self.schoolType.setTitle(val, for: .normal)
                            self.School!.forEach ({ (school:SchoolType) in
                                if (school.name == val){
                                    self.schoolSelected = school
                                   // self.School?.removeAll()
                                }
                            })

                    }
                }
                        }
                
            }
        }
        
    }
    
    @IBAction func showResult(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "newVC") as? showSchools
        vc?.state = stateSelected.name
        vc?.schoolGender = genderSelected.name
        vc?.schoolType = schoolSelected.name
        vc?.lat = stateSelected.Latitude
        print(stateSelected.Latitude)
        vc?.long = stateSelected.Longitude
        print(stateSelected.Longitude)
        vc?.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
    }
    
}

