//
//  DetailViewController.swift
//  hwsproject1
//
//  Created by Alysha Kester-Terry on 12/26/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView! //Property linked by Editor Assistant
    var selectedImage: String?
    
    /*Load the detail view controller layout from our storyboard.
     Set its selectedImage property to be the correct item from the pictures array.
     Show the new view controller.
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // We can check that selectedImage has a value, and if so pull it out for usage; otherwise, do nothing.
        if let imageToLoad = selectedImage {
            //If for some reason selectedImage is nil (which it should never be, in theory) then the imageView.image line will never be executed. If it has a value, it will be placed into imageToLoad, then passed to UIImage and loaded.
            imageView.image  = UIImage(named: imageToLoad)
        }
        else{
            imageView.image  = UIImage(named: "Error")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
