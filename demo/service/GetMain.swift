//
//  Main.swift
//  demo
//
//  Created by apple on 2020/12/2.
//

import UIKit
import SwiftUI

class GetMain: Service {

    override func nav()->NSObject{
        return DogModel()
    }
    override func list()->[NSObject]{
        return arr
    }
    override func request(){
        
        if arr.count > 0 {
            return
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            
            for index in 0...5{
                let t =  TestModel()
                self.arr.append(t)
                t.click{
                    print(index)
                    
                    push(UIHostingController(rootView: MainView(se: GetDetails())))
                }
            }
            self.onS?()
        }
        
    }
}
