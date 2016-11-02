//
//  YTKNetwork+Ext.swift
//  YTKNetwork-Swifty
//
//  Created by skyline on 2016/11/2.
//  Copyright © 2016年 skyline. All rights reserved.
//

import YTKNetwork

extension YTKRequest {

    func start(success: @escaping (YTKBaseRequest) -> (), failure: @escaping (YTKBaseRequest) -> ()) {
        startWithCompletionBlock(success: { (req) in
            success(req)
        }, failure: { (req) in
            failure(req)
        })
    }

}
