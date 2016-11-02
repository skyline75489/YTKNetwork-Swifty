//
//  YTKNetwork+RxSwift.swift
//  YTKNetwork-Swifty
//
//  Created by skyline on 2016/10/31.
//  Copyright © 2016年 skyline. All rights reserved.
//

import YTKNetwork
import RxSwift

extension YTKRequest {

    func toObservable() -> Observable<YTKBaseRequest> {
        return Observable<YTKBaseRequest>.create { [weak self] observer -> Disposable in
            guard let sself = self else { return Disposables.create() }

            sself.start(success: { (request) in
                observer.on(.next(request))
                observer.on(.completed)
            }, failure: { (request) in
                observer.on(.error(request.error!))
            })
            return Disposables.create {
                sself.stop()
            }
        }
    }

}
