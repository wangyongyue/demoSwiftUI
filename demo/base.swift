//
//  base.swift
//  demo
//
//  Created by apple on 2020/12/2.
//

import SwiftUI

struct WNav:View{
    var se:Service
    var body: some View{
        let nav = se.nav()
        if(nav is DogModel){
            let m = nav as! DogModel
            Dog(model: m)
        }
    }
}
struct WList:View{
    var se:Service
    @State var list:[NSObject] = []
    var body: some View{
        List(0..<list.count, id: \.self){ item in
            if(list[item] is DogModel){
                let m = list[item] as! DogModel
                Dog(model: m)
            }else if(list[item] is TestModel){
                let m = list[item] as! TestModel
                Test(model: m)
            }
        }.onAppear(){
            
            se.onSuccess {
                list = se.list()
            }
            se.onFail {
                
            }
        }
    }
}
struct Dog:View{
    var model:DogModel
    var body: some View{
        Text("Dog")
    }
}

class DogModel:NSObject{
}
class Service{
    
    var arr:[NSObject] = []
    var onS:(()->Void)?
    var onf:(()->Void)?
    var onB:(()->Void)?

    func nav()->NSObject{
        return DogModel()
    }
    func list()->[NSObject]{
        return arr
    }
    func request(){
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            
            self.arr.append(DogModel())
            self.arr.append(DogModel())
            self.arr.append(DogModel())
            
            self.onS?()
        }
        
    }
   
    func onSuccess(_ callBack:(()->Void)?){
        onS = callBack
    }
    func onFail(_ callBack:(()->Void)?){
        onf = callBack
    }
    func onBack(_ callBack:(()->Void)?){
        onB = callBack
    }
}
