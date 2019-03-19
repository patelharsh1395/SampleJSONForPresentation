//
//  ViewController.swift
//  SampleJSONForPresentation
//
//  Created by MacStudent on 2019-03-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var data : [JsonData] = ()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getJsonData()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : CustomCellTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "Cells", for: indexPath) as! CustomCellTableViewCell
        cell.titleText.text = self.data![indexPath.row].title
        cell.descText.text = self.data![indexPath.row].body
//        cell.textLabel?.text = self.data![indexPath.row].title
//        cell.description = self.data![indexPath.row].body
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    func getJsonData()
    {
        let url = "https://jsonplaceholder.typicode.com/posts"
    
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in
                print("inside block")
            guard let dt = data  else {return}
            var decoder = JSONDecoder()
            do{
                
            
           self.data = try  decoder.decode([JsonData].self, from: dt)
            }
            catch
            {
                print("\(error)")
            }
        
        }.resume()
    }

}

