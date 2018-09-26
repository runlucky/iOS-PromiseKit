//
//  ViewController.swift
//  iOS-PromiseKit
//
//  Created by H5266 on 2018/09/26.
//  Copyright © 2018年 Kakeru. All rights reserved.
//

import UIKit
import Foundation
import PromiseKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello, 🍄")

        let promises = [1, 2, 3, nil, 4, 5, 6, 7, 8, 9].map { x -> Promise<String> in
            return hoge(x)
        }

        when(resolved: promises).done { values in
            values.forEach {
                print($0)
            }
        }

//        print("a")
//        firstly {
//            hoge(false)
//        }.done { result in
//            print(result)
//        }.catch { error in
//            print(error)
//        }
//        print("d")

    }

    func hoge(_ value: Int?) -> Promise<String> {
        return Promise<String> { resolver in
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(arc4random_uniform(5))) {
                print(value ?? 0)
                guard let value = value else {
                    return resolver.reject(PromiseError())
                }
                return resolver.fulfill(value.description)
            }

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class PromiseError: Error {
    let result: String = ""
}
