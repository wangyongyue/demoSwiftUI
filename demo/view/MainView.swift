//
//  main.swift
//  demo
//
//  Created by apple on 2020/12/2.
//


import SwiftUI


struct MainView:View {
    var se:Service
    var body: some View{
        VStack{
            WNav(se:se)
            WList(se:se)
        }.onAppear(){
            print(se)
            se.request()
        }
       
    }
}

