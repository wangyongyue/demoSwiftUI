//
//  ContentView.swift
//  demo
//
//  Created by apple on 2020/12/2.
//

import SwiftUI

struct ContentTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            MainView(se:GetMain()).tabItem {
                Image(systemName: "star")
                Text("One")
            }
            .tag(0)
            ContentView().tabItem {
                Image(systemName: "star")
                Text("One")
            }
            .tag(1)
            
        }
    }
}

struct ContentView: View {
    @State private var text: String = "sdfsfsd"
    
    var body: some View {
        
        List(0..<10){item in
            Text("\(text)\(item)")
            Button("sdf"){
                var a =  currentViewController()
                 print(a)
                 a?.present(UIHostingController(rootView:Details(se: GetMain())), animated: true, completion: nil)
            }
        }
    }
}
func currentViewController() -> (UIViewController?) {
   var window = UIApplication.shared.keyWindow
   if window?.windowLevel != UIWindow.Level.normal{
     let windows = UIApplication.shared.windows
     for  windowTemp in windows{
       if windowTemp.windowLevel == UIWindow.Level.normal{
          window = windowTemp
          break
        }
      }
    }
   let vc = window?.rootViewController
   return currentViewController(vc)
}


func currentViewController(_ vc :UIViewController?) -> UIViewController? {
   if vc == nil {
      return nil
   }
   if let presentVC = vc?.presentedViewController {
      return currentViewController(presentVC)
   }
   else if let tabVC = vc as? UITabBarController {
      if let selectVC = tabVC.selectedViewController {
          return currentViewController(selectVC)
       }
       return nil
    }
    else if let naiVC = vc as? UINavigationController {
       return currentViewController(naiVC.visibleViewController)
    }
    else {
       return vc
    }
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Details:View {
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

