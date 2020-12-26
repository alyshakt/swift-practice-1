//
//  ViewController.swift
//  hwsproject1
//
//  Created by Alysha Kester-Terry on 12/26/20.
//

import UIKit

class ViewController: UIViewController {
    //To create a property, you need to declare it outside of methods
       var pictures = [String]() //That pictures array will be created when the ViewController screen is created, and exist for as long as the screen exists.
       var prefix = "nssl"
    
       override func viewDidLoad() {
           super.viewDidLoad()
           let fm = FileManager.default //declares a constant called fm and assigns it the value returned by FileManager.default. This is a data type that lets us work with the filesystem
           let path = Bundle.main.resourcePath! //declares a constant called path that is set to the resource path of our app's bundle. Remember, a bundle is a directory containing our compiled program and all our assets. So, this line says, "tell me where I can find all those images I added to my app."
           let items = try! fm.contentsOfDirectory(atPath: path) //declares a third constant called items that is set to the contents of the directory at a path. Which path? Well, the one that was returned by the line before.
       
           for item in items{ //starts a loop that will execute once for every item we found in the app bundle.
               if item.hasPrefix(prefix){
                   //What we really want is to add to the pictures array all the files we match inside our loop.
                   pictures.append(item)
               }
           }
           print(pictures)
       }

}

