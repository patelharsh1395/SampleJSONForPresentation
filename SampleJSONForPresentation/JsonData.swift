//
//  JsonData.swift
//  SampleJSONForPresentation
//
//  Created by MacStudent on 2019-03-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation


class JsonData : Codable
{
    var Title : String
    var Body : String
   
    
    enum CodingKeys : String , CodingKey
    {
        case Title = "title"
        case Body = "body"
    }
    
    
    
    
    
}

extension JsonData
{
    static func getData(delegate: NetworkCallBack)
    {
    
        let url = "https://jsonplaceholder.typicode.com/posts"
        var temp : [JsonData] = []
        
            URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in
            
            guard let dt = data  else {return}
            
             let decoder = JSONDecoder()
            do{
               
                temp.append(contentsOf: try  decoder.decode([JsonData].self, from: dt))
               // print(try  decoder.decode([JsonData].self, from: dt).count)
               
                //  print(self.data[0].body)
                delegate.onSuccess(data: temp)
            }
            catch
            {
                delegate.onFail(error: err!)
            }
            
            }.resume()
        
        
        
        
    }
    
}


