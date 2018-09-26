//
//  ViewController.swift
//  iOS-PromiseKit
//
//  Created by H5266 on 2018/09/26.
//  Copyright © 2018年 Kakeru. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello, 🍄")

        _ = Promise<String> { seal in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                seal.fulfill("DONE!")
                print(1)
            }
        }.then { result -> Promise<String> in
            Promise<String> { seal in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    print(2)
                    print("result: " + result)
                    seal.fulfill("DONE!!")
                }
            }
        }.done { value in
            print(3)
            print(value)
        }

        print(4)
    }

    // Do any additional setup after loading the view, typically from a nib.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

