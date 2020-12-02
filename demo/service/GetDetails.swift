//
//  GetDetails.swift
//  demo
//
//  Created by apple on 2020/12/2.
//

import UIKit
import SwiftUI

class GetDetails: Service {

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
            
            self.arr.append(DogModel())
            self.arr.append(DogModel())
            self.arr.append(DogModel())
            self.arr.append(DogModel())

            self.onS?()
        }
        
    }
}
