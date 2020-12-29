//
//  DetailViewController.swift
//  HWSProject
//
//  Created by Alysha Kester-Terry on 12/26/20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView! //Property linked by Editor Assistant
    @IBOutlet var bioMessage: UITextView!
    @IBOutlet var phoneNumber: UITextView!
    @IBOutlet var emailLink: UITextView!
    
    var memberName: String?
    var selectedImage: String?
    var prefix = "DD-"
    var suffix = ".jpg"
    
    /*Load the detail view controller layout from our storyboard.
     Set its selectedImage property to be the correct item from the pictures array.
     Show the new view controller.
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bioMessage.textContainerInset = UIEdgeInsets(top:0,left:20,bottom:0,right:10)
        phoneNumber.textContainerInset = UIEdgeInsets(top:0,left:20,bottom:0,right:10)
        emailLink.textContainerInset = UIEdgeInsets(top:0,left:20,bottom:0,right:10)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        navigationController?.navigationBar.prefersLargeTitles = true
        let pictureName = selectedImage?.description.replacingOccurrences(of: prefix, with: "").replacingOccurrences(of: suffix, with: "")
        title = pictureName
        memberName = getMember(pictureName: pictureName!)
        // We can check that selectedImage has a value, and if so pull it out for usage; otherwise, do nothing.
        if let imageToLoad = selectedImage {
            //If for some reason selectedImage is nil (which it should never be, in theory) then the imageView.image line will never be executed. If it has a value, it will be placed into imageToLoad, then passed to UIImage and loaded.
            imageView.image = UIImage(named: imageToLoad)
        }
        bioMessage =  getMemberText(memberName: memberName!)
        phoneNumber =  getMemberPhone(memberName: memberName!)
        emailLink = getMemberEmail(memberName: memberName!)
        imageView.accessibilityIdentifier = "Profile image"
        bioMessage.accessibilityIdentifier = "Bio"
        phoneNumber.accessibilityIdentifier = "Phone"
        emailLink.accessibilityIdentifier = "Email"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        guard let phone = phoneNumber.text else {
            print("No phone found")
            return
        }

        let vc = UIActivityViewController(activityItems: [image, phone], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    private func getMember(pictureName: String) -> String{
        var member = "Nobody Found"
        
        if pictureName.lowercased().contains("dorn"){
            member = "Dornn Harris"
        }
        if pictureName.lowercased().contains("bri"){
            member = "Brianna Davis"
        }
        if pictureName.lowercased().contains("oks"){
            member = "Oksana Gritsaeva"
        }
        if( pictureName.lowercased().contains("sam")){
            member = "Samantha (Moyer) Lange"
        }
        if( pictureName.lowercased().contains("jess")){
            member = "Jessica Bryan"
        }
        if( pictureName.lowercased().contains("lana")){
            member = "Lana Abuhudra"
        }
        if( pictureName.lowercased().contains("bec")){
            member = "Becca Barratt"
        }
        if( pictureName.lowercased().contains("aly")){
            member = "Alysha Kester-Terry"
        }
        return member
    }
    
    private func getMemberText(memberName: String) -> UITextView{
        let lowerMemberName = memberName.lowercased()
        var intro = "No Bio Found"
        if lowerMemberName.contains("aly"){
            intro = "\(memberName) is a Software Developer at Medici Ventures"
        }
        if lowerMemberName.contains("dorn"){
            intro = "\(memberName) is an Integration Project Manager at SAP"
        }
        if lowerMemberName.contains("bri"){
            intro = "\(memberName) is a Senior Manager in Strategic Business Development at Adobe"
        }
        if lowerMemberName.contains("oks"){
            intro = "\(memberName) is an Access Specialist at University of Utah Health"
        }
        else if( lowerMemberName.contains("sam")){
            intro = "\(memberName) is a Senior Project Manager for CIRRUS/V2X at Panasonic North America"
        }
        else if( lowerMemberName.contains("jess")){
            intro = "\(memberName) is the VP of Sales and Business Development at Service Robotics & Technologies"
        }
        else if( lowerMemberName.contains("lana")){
            intro = "\(memberName) is a Enterprise Employee Experience Product Specialist at Qualtrics"
        }
        else if( lowerMemberName.contains("becca")){
            intro = "\(memberName) is a UX Designer at Rainfocus"
        }
        bioMessage.text = intro
        bioMessage.isUserInteractionEnabled = true
        bioMessage.isEditable = false
        return bioMessage
    }
    
    private func getMemberPhone(memberName: String)-> UITextView{
        let lowerMemberName = memberName.lowercased()
        var phone = "No Phone Number Found"
        if lowerMemberName.contains("aly"){
            phone = "Phone: (801) 915-3591"
        }
        if lowerMemberName.contains("dorn"){
            phone = "Phone: (801) 783-4757"
        }
        if lowerMemberName.contains("bri"){
            phone = "Phone: (801) 783-4757"
        }
        if lowerMemberName.contains("oks"){
            phone = "Phone: (801) 783-4757"
        }
        if( lowerMemberName.contains("sam")){
            phone = "Phone: (801) 783-4757"
        }
        if( lowerMemberName.contains("jess")){
            phone = "Phone: (801) 783-4757"
        }
        if( lowerMemberName.contains("lana")){
            phone = "Phone: (801) 783-4757"
        }
        if( lowerMemberName.contains("becca")){
            phone = "Phone: (801) 783-4757"
        }
        phoneNumber.text = phone
        phoneNumber.isUserInteractionEnabled = true
        return phoneNumber
    }
    
    private func getMemberEmail(memberName: String)-> UITextView{
        let lowerMemberName = memberName.lowercased()
        var email = "No Email Found"
        if lowerMemberName.contains("aly"){
            email = "design@alyshakt.com"
        }
        if lowerMemberName.contains("dorn"){
            email = "dornn.harris@gmail.com"
        }
        if lowerMemberName.contains("bri"){
            email = "briannamarie373@gmail.com"
        }
        if lowerMemberName.contains("oks"){
            email = "oksana.gritsaeva@gmail.com"
        }
        if( lowerMemberName.contains("sam")){
            email = "samantha.moyer6@gmail.com"
        }
        if( lowerMemberName.contains("jess")){
            email = "jess@jbcsuite.com"
        }
        if( lowerMemberName.contains("lana")){
            email = "lanaabuhudra@qualtrics.com"
        }
        if( lowerMemberName.contains("becca")){
            email = "rebecca.barratt@gmail.com"
        }
        emailLink.text = email
        emailLink.isUserInteractionEnabled = true
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
        return emailLink
    }
    
}
