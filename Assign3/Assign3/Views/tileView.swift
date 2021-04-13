//
//  tileView.swift
//  Assign3
//
//  Created by Ethan  Xu on 4/12/21.
//

import SwiftUI

struct tileView: View {
    var tile: Tile = Tile(val: 0, id: 0, row: 0, col: 0)
    var color: Color = Color.white
    
    init(tile: Tile){
        self.tile = tile
        if(tile.val == 1){
            color = Color.green
        } else if (self.tile.val == 2){
            color = Color.blue
        } else if (self.tile.val > 2) {
            color = Color.purple
        }
    }
    
    var body: some View {
        Text(tile.val.description)
            .frame(width: 65, height: 65)
            .background(color)
    }
}

struct tileRowView: View {
    @EnvironmentObject var game: Triples
    var row: Int = 0
    
    init(row: Int){
        self.row = row
    }
    
    var body: some View{
        HStack {
            tileView(tile: Tile(val:game.board[row][0],id:1,row:1,col:1))
                .padding(.top, 8)
                .padding(.leading, 8)
            tileView(tile: Tile(val:game.board[row][1],id:1,row:1,col:1))
                .padding(.top, 8)
                .padding(.leading, 8)
            tileView(tile: Tile(val:game.board[row][2],id:1,row:1,col:1))
                .padding(.top, 8)
                .padding(.leading, 8)
            tileView(tile: Tile(val:game.board[row][3],id:1,row:1,col:1))
                .padding(.top, 8)
                .padding(.leading, 8)
        }
    }
}

struct tileView_Previews: PreviewProvider {
    static var previews: some View {
        tileView(tile: Tile(val:1,id:1,row:1,col:1))
    }
}
