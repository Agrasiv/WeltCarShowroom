//
//  CarDetailVC.swift
//  WeltCarShowroom
//
//  Created by Pyae Phyo Oo on 06/10/2021.
//

import Foundation
import UIKit
import AdvancedPageControl

class CarDetailVC : UIViewController {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var viewAddtocalendar: UIView!
    @IBOutlet weak var viewExtend: UIView!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var viewGetDirection: UIView!
    @IBOutlet weak var viewTen: UIView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: AdvancedPageControlView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIdetail()
        pageControl.drawer = SlideDrawer(
            height: 8,
            width: 8,
            space: 8,
            raduis: 3,
            currentItem: 0,
            indicatorColor: UIColor.black,
            dotsColor: .clear,
            isBordered: true,
            borderColor: UIColor.black,
            borderWidth: 1,
            indicatorBorderColor: UIColor.black,
            indicatorBorderWidth: 1)
        setUpCollectionView()
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func UIdetail() {
        viewAddtocalendar.layer.borderWidth = 1
        viewAddtocalendar.layer.borderColor = UIColor.black.cgColor
        viewExtend.layer.borderWidth = 1
        viewExtend.layer.borderColor = UIColor.black.cgColor
        viewGetDirection.layer.borderWidth = 1
        viewGetDirection.layer.borderColor = UIColor.black.cgColor
        viewTen.layer.borderWidth = 1
        viewTen.layer.borderColor = UIColor.black.cgColor
    }
    
    fileprivate func setUpCollectionView() {
        let colNib = UINib (nibName: "BannerCollectionCell", bundle: nil)
        bannerCollectionView.register(colNib, forCellWithReuseIdentifier: "BannerCollectionCell")
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
    }
}

extension CarDetailVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionCell", for: indexPath) as! BannerCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        pageControl.setPageOffset(offSet/width)
    }
}
