//
//  YTKRequest+SwiftyJSON.swift
//  YTKNetwork-Swifty
//
//  Created by skyline on 2016/11/1.
//  Copyright © 2016年 skyline. All rights reserved.
//

import YTKNetwork
import SwiftyJSON

extension YTKRequest {

    func start(success: @escaping (JSON) -> (), failure: @escaping (Error) -> ()) {
        start(success: { (req) in
            if let data = req.responseData {
                success(JSON(data: data))
                return
            }
            if let str = req.responseString {
                success(JSON(stringLiteral: str))
                return
            }
            success(JSON(req.responseObject!))
        }, failure: { (req) in
            failure(req.error!)
        })
    }

}
