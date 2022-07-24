//
//  ViewController.swift
//  blogs
//
//  Created by Md Omar Faruq on 7/23/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate {
   
    
    
    @IBOutlet weak var testlbl: UILabel!
    
    @IBOutlet weak var tblgetPost: UITableView!
    var postArray:[GetPost] = []
    var postId = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        seeAllPost()
        // Do any additional setup after loading the view.
        tblgetPost.dataSource = self
        tblgetPost.delegate = self
        registerTableViewCells()
       
        
    }
    func seeAllPost()
    {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
      
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
                 
                    self.postArray = postArr
                    
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
                            self.tblgetPost.reloadData()
                            
                        }
                        
                    }
                  
                  //  self.seeAllPost()
                } catch {
                    print(error)
                }
            }
        }.resume()
        
    }
    
    
    private func registerTableViewCells() {
        let DocumentCell = UINib(nibName: "PostCell",
                                  bundle: nil)
        self.tblgetPost.register(DocumentCell,
                                forCellReuseIdentifier: "PostCell")
        self.tblgetPost.rowHeight = 150
      
        self.tblgetPost.allowsSelection = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let currentCell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell{
            let post = postArray[indexPath.row]
            currentCell.title.text = post.title
            currentCell.body.text = post.body
           
            currentCell.dView.tag = indexPath.row
                        currentCell.dView.addTarget(self, action: #selector(Clicked(sender:)), for: .touchUpInside)
            
            return currentCell
        }
        
        return UITableViewCell()
    }

    @objc  func Clicked(sender: UIButton) {
        let post = postArray[sender.tag]
//        let vc = UIStoryboard.init(name:"PostD", bundle: Bundle.main).instantiateViewController(withIdentifier:"post") as? PostViewDetailsViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"PostD") as! PostViewDetailsViewController
        vc.postId = post.id
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//        let post = postArray[indexPath.row]
//       print(indexPath.row)
//       let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "detailspost") as? PostViewDetailsViewController
//        vc?.postId = post.id
//
//       self.navigationController?.pushViewController(vc!, animated: true)
////       let postView = PostViewDetailsViewController(nibName: "PostViewDetailsViewController", bundle: nil)
////       self.view .addSubview(postView.view)
//
//
//
//    }
//
//

}



