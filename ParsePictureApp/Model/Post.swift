//
//  Post.swift
//  ParsePictureApp
//
//  Created by Safa on 8.09.2023.
//

import Foundation
import ParseSwift


struct Post : ParseObject {
    
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseSwift.ParseACL?
    
    var comment : String?
    var username : String?
    var imageData : Data?
 
}
