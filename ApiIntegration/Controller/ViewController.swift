//
//  ViewController.swift
//  ApiIntegration
//
//  Created by Shahzaib khan on 15/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UIToolbarDelegate,UITableViewDataSource{
    @IBOutlet weak var tableview:UITableView!
    let apiIntegrate = IntegrateApi()
    let image = "https://api.opendota.com"
    var loadedImages = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.tableFooterView = UIView()
        apiIntegrate.callingApi {
            DispatchQueue.main.async {
                print("printing data")
                self.tableview.reloadData()
            }
           }
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiIntegrate.getValue().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // concate urls
         var imgageString = image + apiIntegrate.getValue()[indexPath.row].img
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        IntegrateApi.downloadImage(imgageString)
//        {
//             DispatchQueue.main.async {
//                self.loadedImages.append(IntegrateApi.downloadImages)
//                print(self.loadedImages.count)
//                cell.images.image = IntegrateApi.downloadImages
//        }
//        }
        cell.name.text = String(apiIntegrate.getValue()[indexPath.row].id)
        cell.id.text = apiIntegrate.getValue()[indexPath.row].name
         cell.images.downloaded(from: imgageString)
        return cell
    }

}
