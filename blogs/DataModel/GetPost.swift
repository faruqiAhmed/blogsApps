//
//  GetPost.swift
//  blogs
//
//  Created by Md Omar Faruq on 7/23/22.
//

import UIKit

class GetPost: NSObject ,Decodable {

    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
       case userId
       case id
       case title
      case body
     
       

       
    }
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
      
        self.userId = try container.decode(Int.self, forKey: .userId)
       self.id = try container.decode(Int.self, forKey: .id)
     //   self.title = try container.decode([String.self, forKey: .title)
        self.title = try container.decode(String.self, forKey: .title)
        self.body = try container.decode(String.self, forKey: .body)
    }
    
    
    
}
