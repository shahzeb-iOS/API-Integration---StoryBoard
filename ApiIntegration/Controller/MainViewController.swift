//
//  MainViewController.swift
//  ApiIntegration
//
//  Created by Shahzaib khan on 16/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var apiIntegrate = IntegrateApi()
    @IBOutlet weak var pressBtn:UIBarButtonItem!
    @IBOutlet weak var listContainer: UIView!
    @IBOutlet weak var gridContainer: UIView!
    var pressedButton = true
    override func viewDidLoad() {
        super.viewDidLoad()
        listContainer.isHidden = true
    }
    @IBAction func clickedBtn(_ sender: Any)
    {
        if pressedButton == true
        {
            pressBtn.title = "Grid"
            listContainer.isHidden = false
            gridContainer.isHidden = true
            pressedButton = false
        }
        else
        {
             pressBtn.title = "List"
            listContainer.isHidden = true
            gridContainer.isHidden = false
            pressedButton = true

        }
    }
}
//Marks:- Spinner Extention
extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 2)
        let ai = UIActivityIndicatorView.init(style: .white)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        return spinnerView
    }
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
