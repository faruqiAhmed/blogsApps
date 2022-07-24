//
//  Post.swift
//  blogs
//
//  Created by Md Omar Faruq on 7/23/22.
//

import UIKit

class Post: NSObject,Decodable{
    var data : [GetPost]
    
    enum CodingKeys: String, CodingKey {
       case data
     
       

       
    }
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
       self.data = try container.decode([GetPost].self, forKey: .data)
       
       
    }
    
}
