//
//  gameTypeView.swift
//  Assign3
//
//  Created by Ethan  Xu on 4/12/21.
//

import SwiftUI

struct gameTypeView: View {
    @EnvironmentObject var game: Triples 
    
    var body: some View {
        Picker(selection: $game.game_type, label:Text("Hi Marsh!"))  {
            Text("Deterministic").tag(false)
            Text("Random").tag(true)
        }.pickerStyle(SegmentedPickerStyle())
        .frame(width: 350)
    }
}

struct gameTypeView_Previews: PreviewProvider {
    static var previews: some View {
        gameTypeView()
    }
}
