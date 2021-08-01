//
//  UserSelected.swift
//  schoolApp
//
//  Created by mac on 05/07/2021.
//

import UIKit
import DPPickerManager
import FirebaseFirestore

class UserSelected: UITableViewController {

      private var service: StateService?
     
//    private var allStates = [states]() {
//            didSet {
//                DispatchQueue.main.async {
//                    self.state = self.allStates
//                }
//            }
//        }
        
  
//    func loadData() {
//            service = StateService()
//
//            service?.get(collectionID: "states") { statesData in
//                self.allStates = statesData
//            }
//        }
    
//    var ref = Database.database().reference().child("states")
    
   
    var states = ["Riyadh" , "Dammam","Qasem","Makkah"]
    var Gender = ["بنين","بنات"]
    var schoolCatigory = ["حكومي" , "اهلية ","دولية"]
    var state2 = [String]()
    
    var stateSelected:String!
    var genderSelected:String!
    var schoolSelected:String!
    
   
    
    @IBOutlet weak var stataName: UIButton!
    @IBOutlet weak var gendarType: UIButton!
    @IBOutlet weak var schoolType: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Request.shared.addStates()
        print("count:\(state2.count)")
    }

    // MARK: - Table view data source
    
    
    @IBAction func stateTapped(_ sender: Any) {
        DPPickerManager.shared.showPicker(title: "اختار المنطقة", selected: states[0], strings: states) { value, index, cancel in
            if !cancel{
                if let val = value{
                    self.genderSelected = nil
                    self.stataName.setTitle(val, for: .normal)
                    self.gendarType.setTitle("اختار الجنس", for: .normal)
                    self.schoolType.setTitle("اختار نوع المدرسة", for: .normal)
                    self.states.forEach ({ state in
                        if (state == val){
                            self.stateSelected = state
                        }
                    })
                    
                }
                
                
            }
        }
        
    }
    @IBAction func gendarTypeTapped(_ sender: Any) {
        DPPickerManager.shared.showPicker(title: "اختارالجنس ", selected: Gender[0], strings: Gender) { value, index, cancel in
            if !cancel{
                if let val = value{
                    self.schoolSelected = nil
                    self.gendarType.setTitle(val, for: .normal)
                    self.schoolType.setTitle("اختار نوع المدرسة", for: .normal)
                    self.Gender.forEach ({ gender in
                        if (gender == val){
                            self.genderSelected = gender
                        }
                    })
                    
                }
                
                
            }
        }
    }
    
    
    @IBAction func schoolTypeTapped(_ sender: Any) {
        DPPickerManager.shared.showPicker(title: "اختار نوع المدرسة ", selected: schoolCatigory [0], strings: schoolCatigory) { value, index, cancel in
            if !cancel{
                if let val = value{
                    self.schoolType.setTitle(val, for: .normal)
                    self.schoolCatigory.forEach ({ school in
                        if (school == val){
                            self.schoolSelected = school
                        }
                    })
                    
                }
                
                
            }
        }
    }
    
    @IBAction func showResultTapped(_ sender: Any) {
        
    }

}
