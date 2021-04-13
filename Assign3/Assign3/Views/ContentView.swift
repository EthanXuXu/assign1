//
//  ContentView.swift
//  Assign3
//
//  Created by Ethan  Xu on 4/12/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game: Triples = Triples()
    
    var body: some View {
        VStack {
            Text("Score: \(game.score)").font(.title)
            boardView()
            
            buttonsView().padding(.top, 10)
            
            gameTypeView()
        }
        .environmentObject(game)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
