//
//  ViewController.swift
//  sss
//
//  Created by Mohammed Mabruk on 09/04/1443 AH.
//

import UIKit
struct Page : Codable {
    var page : Int
}
class ViewController: UIViewController {
     

    override func viewDidLoad() {
        super.viewDidLoad()
        getcharacters()
        // Do any additional setup after loading the view.
    }

    func getcharacters () {
        var urlcomponents = URLComponents()
        urlcomponents.scheme = "https"
        urlcomponents.host = "a.4cdn.org"
        urlcomponents.path = "/po/threads.json"
        
        var urlRequest = URLRequest(url: urlcomponents.url!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
          do {
            let JSONDecoder = JSONDecoder()
            let Characters = try JSONDecoder.decode([Page].self, from: data!)
            print(Characters)
          } catch {
              print((error))
          }
        }
        task.resume()
     }
    }
        
    



