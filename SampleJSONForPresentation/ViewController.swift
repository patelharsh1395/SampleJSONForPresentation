//
//  ViewController.swift
//  SampleJSONForPresentation
//
//  Created by MacStudent on 2019-03-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, NetworkCallBack {
   
    

    
    
  //  var data1 : [JsonData] = [JsonData("Harsh","patel"), JsonData("Mahendra","Singh")]
    var data : [JsonData] = []
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        JsonData.getData(delegate: self)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomCellTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "Cells", for: indexPath) as! CustomCellTableViewCell
        print(self.data.count,"counting")
        cell.titleText.text = self.data[indexPath.row].Title
        cell.descText.text = self.data[indexPath.row].Body
//        cell.textLabel?.text = self.data![indexPath.row].title
//        cell.description = self.data![indexPath.row].body
        
        
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 400
    }
   
    
    func onSuccess(data: [JsonData]) {
        self.data.append(contentsOf: data)
        DispatchQueue.main.async {
            print("COUNT : \(data.count)")
            self.tableview.reloadData()
        }
        
    }
    
    func onFail(error: Error) {
        print("ERROR : \(error)")
    }
}

