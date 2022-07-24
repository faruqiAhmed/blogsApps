//
//  PostViewDetailsViewController.swift
//  blogs
//
//  Created by Md Omar Faruq on 7/23/22.
//

import UIKit

class PostViewDetailsViewController: UIViewController,UINavigationControllerDelegate {
    var postId = Int()
    var postArray:[GetPost] = []
    @IBOutlet weak var lblBody: UITextView!
    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        seeAllPost()
        // Do any additional setup after loading the view.
    }
    func seeAllPost()
    {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let parameterDictionary = ["id": postId]
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
//       print(token)
//        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                 
                 let response = try JSONDecoder().decode([GetPost].self, from: data)
                
//                    print(response.status)
//                    print(response.message)
                    // print(response..description)
                    
                    let postArr = response
//
                    self.postArray = postArr
//
                    print(self.postArray.count)
                   
                    for post in response
                    {
                        print(post.title)
                        print(post.body)
//                        print(post.profile_url)
//                        print(post.profile_name)
                        
                        // Dispatch que main thread
                        DispatchQueue.main.async {
                          //  self.userName.text = post.content
                        //    self.title.text = post.title
                          //  self.testlbl.text = post.title
                            self.lblTitle.text = post.title
                            self.lblBody.text = post.body
                            
                        }
                        
                    }
                  
                  //  self.seeAllPost()
                } catch {
                    print(error)
                }
            }
        }.resume()
        
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
