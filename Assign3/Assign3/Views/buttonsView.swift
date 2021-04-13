//
//  buttonsView.swift
//  Assign3
//
//  Created by Ethan  Xu on 4/12/21.
//

import SwiftUI

struct buttonsView: View {
    @EnvironmentObject var game: Triples
    
    var body: some View {
        VStack {
            Button("Up"){
                game.collapse(dir:.up)
            }.frame(width: 100, height:60)
            .background(Color.orange)
            .foregroundColor(.white)
            .font(.title)
            .cornerRadius(12)

            HStack(alignment: .center) {
                Button("Left"){
                    game.collapse(dir:.left)
                }.frame(width: 100, height:60)
                .background(Color.orange)
                .foregroundColor(.white)
                .font(.title)
                .cornerRadius(12)
                .padding()
                
                Button("Right"){
                    game.collapse(dir:.right)
                }.frame(width: 100, height:60)
                .background(Color.orange)
                .foregroundColor(.white)
                .font(.title)
                .cornerRadius(12)
                .padding()
            }
            
            Button("Down"){
                game.collapse(dir:.down)
            }.frame(width: 100, height:60)
            .background(Color.orange)
            .foregroundColor(.white)
            .font(.title)
            .cornerRadius(12)
            .padding(.bottom)

            
            Button("New Game"){
                game.newgame()
                for _ in 1...4 {
                    game.spawn()
                }
            }.frame(width: 150, height:60)
            .background(Color.orange)
            .foregroundColor(.white)
            .font(.title)
            .cornerRadius(12)
        }
    }
}

struct buttonsView_Previews: PreviewProvider {
    static var previews: some View {
        buttonsView()
    }
}
