//
//  newVC.swift
//  schoolApp
//
//  Created by mac on 08/07/2021.
//

import UIKit
import FirebaseFirestore

class showSchools: UIViewController, UITableViewDelegate,UITableViewDataSource {

    let schoolRef = Request.shared.db.collection("Schools")
    var state:String = ""
    var schoolGender:String = ""
    var schoolType:String = ""
    var lat:Double = 0.0
    var long:Double = 0.0
    
    var schoolData:[SchoolData] = []
    private var service: StateService?
    //let tableView = UITableView()
    @IBOutlet weak var tableView: UITableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Schools"
            print("latitiude:\(lat)")
            print("latitiude:\(long)")
            
            tableView.dataSource = self
            tableView.delegate = self
            tableView.tableFooterView = UIView()
           // setupTableView()
            loadSchoolData()
        }
    //MARK:- methods
    func loadSchoolData() {
            service = StateService()
            service?.getSchoolData(collectionID: "Schools",state: state,gender: schoolGender,type: schoolType) { schoolData in         
                self.schoolData = schoolData
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(self.schoolData)// data have been saved in schoolData
                print("schoolData loadded...")
            }
       
        
        }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          //  return state.count
        return schoolData.count
        }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SchoolCell
       // cell!.accessoryType = .disclosureIndicator
        cell?.schoolName.text = schoolData[indexPath.row].school_name
        cell?.schoolName?.font = .systemFont(ofSize: 15, weight: .medium)
        cell?.gender?.text = schoolData[indexPath.row].school_gender
        cell?.gender?.font = .systemFont(ofSize: 15, weight: .medium)
        cell?.location?.text = schoolData[indexPath.row].school_location
        cell?.location?.font = .systemFont(ofSize: 15, weight: .medium)
        cell?.type?.text = schoolData[indexPath.row].school_type
        cell?.type?.font = .systemFont(ofSize: 15, weight: .medium)
        return cell ?? UITableViewCell()
        }
    
    @IBAction func showOnMapTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapVC") as? MapVC
        // send school lant,long and data
       // Test mode
        vc?.schoolDataInMapVC = schoolData
        vc?.lat = lat
        vc?.long = long
        vc?.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil )
    }
    
    @IBAction func backFillterTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "fillterVC") as? fillterVC
        vc?.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
    }
    
}















//        func setupTableView() {
//            view.addSubview(tableView)
//            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//            tableView.allowsSelection = true
//            tableView.isUserInteractionEnabled = true
//            tableView.translatesAutoresizingMaskIntoConstraints = false
//            tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
//            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
//        }
