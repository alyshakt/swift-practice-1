//
//  DetailViewController.swift
//  HWSProject
//
//  Created by Alysha Kester-Terry on 12/26/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView! //Property linked by Editor Assistant
    @IBOutlet var textView: UITextView!
    
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
            textView =  getMemberText(pictureName: pictureName!)
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
    
    func getMemberText(pictureName: String) -> UITextView{
        var intro = "Arbitrary"
        if pictureName.lowercased().contains("oksana"){
            intro = "Oksana Kaneva is an Access Specialist at University of Utah Health and cherished member of D+D! \n"
        }
        else if( pictureName.lowercased().contains("sam")){
            intro = "Sam is a cherished member of D+D! \n"
        }
        else if( pictureName.lowercased().contains("jess")){
            intro = "Jess is a cherished member of D+D! \n"
        }
        else if( pictureName.lowercased().contains("lana")){
            intro = "Lana is a cherished member of D+D! \n"
        }
        else if( pictureName.lowercased().contains("becca")){
            intro = "Becca Barratt is a UX Designer at Rainfocus and cherished member of D+D! \n"
        }
        textView.text = intro
        textView.isUserInteractionEnabled = true
        textView.isEditable = false
        return textView
    }
    
}
