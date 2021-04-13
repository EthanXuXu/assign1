//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Ethan  Xu on 4/12/21.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width:50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[1])
            LandmarkRow(landmark: landmarks[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
