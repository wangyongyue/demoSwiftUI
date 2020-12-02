//
//  Component.swift
//  demo
//
//  Created by apple on 2020/12/2.
//

import SwiftUI

//----------------
class TestModel:NSObject{
    var onClick:(()->Void)?
    func click(_ callBack:(()->Void)?){
        onClick = callBack
    }
}

struct Test:View{
    var model:TestModel
    var body: some View{
        Text("Test")
        Button("button"){
            model.onClick?()
        }
    }
}

