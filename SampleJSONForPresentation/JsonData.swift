//
//  JsonData.swift
//  SampleJSONForPresentation
//
//  Created by MacStudent on 2019-03-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation


class JsonData : Decodable
{
    var title : String?
    var body : String?
    
    
    enum CodingKeys : String , CodingKey
    {
        case title = "Title"
        case body = "Body"
    }
}


