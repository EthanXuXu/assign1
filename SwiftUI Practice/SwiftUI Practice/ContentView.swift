//
//  ContentView.swift
//  SwiftUI Practice
//
//  Created by Ethan  Xu on 3/11/21.
//

import SwiftUI


//struct ContentView: View {
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//    }
//}

////A view is where the actual UI stuff happens
//struct FooView: View {
//    var body: some View {
//        Text("Hello, world!")
//            .padding() // a fluent API
//        //this means when you call a method on
//        //an object it returns the updated
//        //version
//    }
//}

//struct BooView: View {
//    var body: some View {
//        HStack {
//            Text("a thing")
//            ScrollView {
//                VStack {
//                    ForEach(1...10,id:\.self) {
//                        i in Text("\(i)")
//                    }
//                }
//            }
//            List(1...10, id:\.self){
//                i in Text("\(i)")
//            }
//        }
//    }
//}

//struct BooView: View {
//    @EnvironmentObject var vals: Values
//    @State var mvText: String = String()
//
//    var body: some View {
//        HStack {
//            Text("max:").frame(width:50,height:20).padding()
//            TextField("", text:$mvText){ // allows to type in text and store it in mvText
//                _ in if let i = Int(mvText) { vals.setMax(i)}
//            }
//            .frame(width: 50, height: 20, alignment: .center)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            MyScroll(vals.maxVal).padding()
//        }
//    }
//}
//
//struct jewView: View {
//    var body: some View {
//        TabView {
//            HStack{
//                Text("Hello").padding()
//            }.tabItem {Text("Set Length")}
//            MyScroll(vals.maxVal).padding().tabItem { Text("View List")}
//        }
//    }
//}

struct ButtonView: View {
    @State private var buttonText = "Push me!"
    
    var body: some View {
        Button(action: f) {
            Text(buttonText)
        }
    }
    
    func f(){
        buttonText = "You pushed the button!"
    }
}

struct AlertingButtonView: View {
    @State private var showAlert = false
    
    var body: some View {
        Button("Push me!") {
            showAlert = true
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("This is an alert!"),
                  message: Text("You pushed the button, didn't you!"))
        }
    }
}
//struct MyScroll: View {
//    private var numRange: ClosedRange<Int> // private means only visible to MyScroll
//    
//    init(_ r: ClosedRange<Int>){
//        numRange = r
//    }
//    
//    var body: some View {
//        ScrollView { VStack {
//            ForEach(numRange,id:\.self) {i in Text("\(i)")}
//        }}
//    }
//}
//

///*some creates an opaque type, an opaque type is an inverse of a generic*/
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
