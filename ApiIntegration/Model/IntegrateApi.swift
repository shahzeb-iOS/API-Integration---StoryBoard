//
//  IntegrateApi.swift
//  ApiIntegration
//
//  Created by Shahzaib khan on 15/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import Foundation
import UIKit
class IntegrateApi  {
    var result = [Users]()
    static var downloadImages:UIImage!
    //Marks:- Function ApiIntegration
    func callingApi(completionHandler: @escaping () -> ()) {
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        let urlsession = URLSession.shared.dataTask(with:url!, completionHandler : { (data, response, error) in
            guard let data = data ,error == nil else{
                print(error?.localizedDescription)
                return
            }
            do
            {
                self.result = try JSONDecoder().decode([Users].self, from: data)
                completionHandler()
            }
            catch {}
        }).resume()
    }
    static func downloadImage(_ url:String,Completion: @escaping ()->()) {
        let imageUrl = URL(string: url)
        DispatchQueue.global().async {
            do
            {
                let data = try?Data(contentsOf: imageUrl!)
               let image = UIImage(data: data!)
                downloadImages = image
                Completion()
            } catch { print("Unable to load image")}
        }
    }
    func getValue() -> [Users]
    {

        return result
    }
}
//Marks:- Loadimage Extension
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
