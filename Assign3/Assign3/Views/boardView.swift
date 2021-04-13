//
//  boardView.swift
//  Assign3
//
//  Created by Ethan  Xu on 4/12/21.
//

import SwiftUI

struct boardView: View {
    @EnvironmentObject var game: Triples
    
    var body: some View {
        VStack{
            tileRowView(row: 0)
            tileRowView(row: 1)
            tileRowView(row: 2)
            tileRowView(row: 3)
        }.frame(width: 350, height: 350)
        .background(Color.orange)
    }
}

struct boardView_Previews: PreviewProvider {
    static var previews: some View {
        boardView()
    }
}
