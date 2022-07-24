//
//  DetailsPost.swift
//  blogs
//
//  Created by Md Omar Faruq on 7/23/22.
//

import UIKit

class DetailsPost: NSObject,Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email:String
    var body: String
    
    enum CodingKeys: String, CodingKey {
       case postId
       case id
       case name
        case  email
        case body
     
       

       
    }
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
      
        self.postId = try container.decode(Int.self, forKey: .postId)
       self.id = try container.decode(Int.self, forKey: .id)
     //   self.title = try container.decode([String.self, forKey: .title)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
       
        self.body = try container.decode(String.self, forKey: .body)
    }
    
}
