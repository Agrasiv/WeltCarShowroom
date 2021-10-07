//
//  SearchingVC.swift
//  WeltCarShowroom
//
//  Created by Pyae Phyo Oo on 06/10/2021.
//

import Foundation
import UIKit

class SearchingVC: UIViewController {
    
    @IBOutlet weak var tblCar: UITableView!
    let name = [
                 ["name" : "Mazada 3"],
                 ["name" : "BMW"],
                 ["name" : "Honda Civit"],
                 ["name" : "Honda Fit"],
                 ["name" : "Probox"],
                 ["name" : "Lamborgini"],
                 ["name" : "Ssangayang Tivoii"],
                 ["name" : "Tesla"],
                 ["name" : "Rangerover"],
                 ["name" : "Toyota Seita"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableNib = UINib (nibName: "Carcell", bundle: nil)
        self.tblCar.register(tableNib, forCellReuseIdentifier: "Carcell")
        self.tblCar.delegate = self
        self.tblCar.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SearchingVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Carcell", for: indexPath) as! Carcell
        let row = name[indexPath.row]
        cell.cellName.text = row["name"]
        cell.cellView.layer.borderWidth = 1
        cell.cellView.layer.borderColor = UIColor.white.cgColor
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "CarDetailVC", bundle: nil).instantiateViewController(withIdentifier: "CarDetailVC") as! CarDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
