//
//  PromiseKitViewController.swift
//  GeneralDemo
//
//  Created by mao li on 2021/9/1.
//

import UIKit
import PromiseKit
import Moya
import RxCocoa
import RxSwift

class PromiseKitViewController: UIViewController {

    let provider = MoyaProvider<JokeService>.init()
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstly {
            return Promise<JokeModel>.init { seal in
                provider.rx.request(JokeService.list(sort: "asc", page: 1, pagesize: 20, time: timeStamp()), callbackQueue: nil).map(JokeModel.self, atKeyPath: "", using: JSONDecoder(), failsOnEmptyData: false).asObservable().subscribe { model in
                    return seal.fulfill(model)
                } onError: { error in
                    return seal.reject(error)
                }.disposed(by: disposeBag)
            }
        }.done { model in
            guard let jokes = model.result?.data else { return }
            print("成功")
            
        }.catch { error in
            print(error.localizedDescription)
        }
    }

}

func timeStamp() -> String {
    return String(Int(Date.init(timeIntervalSinceNow: TimeInterval.init(-5 * 365 * 24 * 60 * 60)).timeIntervalSince1970))
}
