//
//  NetworkCallBack.swift
//  SampleJSONForPresentation
//
//  Created by Harsh on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation


protocol NetworkCallBack {
    func onSuccess(data : [JsonData])
    func  onFail(error : Error)
}
