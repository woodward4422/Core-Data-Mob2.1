//
//  Loanee.swift
//  loaner
//
//  Created by Thomas Vandegriff on 3/13/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//

import UIKit

class Loanee: NSObject, NSCoding {
    
    
    
    var name: String
    var contactNumber: String?
    
    enum Keys: String{
        case name = "name"
        case contactNumber = "contactNumber"
    }
    
    init(name: String, contactNumber: String?) {
        
        /** For Future Feature: Ability to access Contacts app:
         init(name: String, profileImage: UIImage, contactNumber: String?) {
         
         self.profileImage = profileImage
         **/
        
        self.name = name
        self.contactNumber = contactNumber
    }
    
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(contactNumber, forKey: "contactNumber")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        contactNumber = aDecoder.decodeObject(forKey: "contactNumber") as? String
        super.init()
    }
    
    
}
