//
//  YTKRequest+Promise.swift
//  YTKNetwork-Swifty
//
//  Created by skyline on 2016/10/31.
//  Copyright © 2016年 skyline. All rights reserved.
//

import YTKNetwork
import PromiseKit

extension YTKRequest {
    func toPromise() -> Promise<YTKBaseRequest> {
        return Promise { fulfill, reject in
            self.startWithCompletionBlock(success: { (request) in
                fulfill(request)
            }, failure: { (request) in
                reject(request.error!)
            })
        }
    }
}
