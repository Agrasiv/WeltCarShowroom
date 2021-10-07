//
//  ViewController.swift
//  WeltCarShowroom
//
//  Created by Pyae Phyo Oo on 06/10/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    @IBAction func clickGo(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SearchingVC", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchingVC") as! SearchingVC
        self.navigationController?.pushViewController(vc, animated: true)
        print("true")
    }
    
}

