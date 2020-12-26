//
//  DetailViewController.swift
//  hwsproject1
//
//  Created by Alysha Kester-Terry on 12/26/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView! //Property linked by Editor Assistant
    @IBOutlet var imageLabel: UILabel!
    
    var selectedImage: String?
    var prefix = "DD-"
    var suffix = ".jpg"
    
    /*Load the detail view controller layout from our storyboard.
     Set its selectedImage property to be the correct item from the pictures array.
     Show the new view controller.
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        let pictureName = selectedImage?.description.replacingOccurrences(of: prefix, with: "").replacingOccurrences(of: suffix, with: "")
        title = pictureName
        // We can check that selectedImage has a value, and if so pull it out for usage; otherwise, do nothing.
        if let imageToLoad = selectedImage {
            //If for some reason selectedImage is nil (which it should never be, in theory) then the imageView.image line will never be executed. If it has a value, it will be placed into imageToLoad, then passed to UIImage and loaded.
            imageView.image  = UIImage(named: imageToLoad)
            imageLabel.text = getPictureInfo(pictureName: pictureName!)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func getPictureInfo(pictureName: String) -> String{
        var returnText = "oopsie"
        if pictureName.lowercased().contains("oksana"){
            returnText = "Oksana is a rad lady!"
        }
        else if( pictureName.lowercased().contains("sam")){
            returnText = "Sam is a rad lady!"
        }
        else if( pictureName.lowercased().contains("jess")){
            returnText = "Jess is a rad lady!"
        }
        else if( pictureName.lowercased().contains("lana")){
            returnText = "Lana is a rad lady!"
        }
        else if( pictureName.lowercased().contains("becca")){
            returnText = "Becca is a rad lady!"
        }
        return returnText
    }
}
