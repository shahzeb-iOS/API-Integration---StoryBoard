//
//  GridViewController.swift
//  ApiIntegration
//
//  Created by Shahzaib khan on 16/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit

class GridViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
@IBOutlet weak var collectionView:UICollectionView!
var apiIntegrate = IntegrateApi()
let image = "https://api.opendota.com"
override func viewDidLoad() {
    super.viewDidLoad()
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 200, height: 230)
    layout.minimumInteritemSpacing = 0
    collectionView.collectionViewLayout = layout
    //Setting Layout
    //  setLayout()
    //Loading spinner
    let loadspinner = UIViewController.displaySpinner(onView: self.view)
    //Api Integration Function calling from other integrate
    apiIntegrate.callingApi {
        DispatchQueue.main.async {
        print("printing data")
            //removing spinner
   UIViewController.removeSpinner(spinner: loadspinner)
    self.collectionView.reloadData()
        }
    }
    // Do any additional setup after loading the view.
}
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return apiIntegrate.getValue().count
}
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    var imagesUrl = image + apiIntegrate.getValue()[indexPath.row].img
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GridCollectionViewCell
    cell.IdLbl.text = apiIntegrate.getValue()[indexPath.row].name
    cell.nameLbl.text = String(apiIntegrate.getValue()[indexPath.row].id)
    cell.images.downloaded(from: imagesUrl)
    return cell
}
//Setting layout
    //Marks:-SetLayout
    func setLayout()
    {
        let itemsize = UIScreen.main.bounds.width/3-4
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: itemsize, height: itemsize)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        collectionView.collectionViewLayout = layout
    }
}
