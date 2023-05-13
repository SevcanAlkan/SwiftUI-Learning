//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Sevcan Alkan on 4/16/23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    init(landmark: Landmark) {
        self.landmark = landmark
    }
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
            Text (landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

//struct LandmarkRow_Previews: PreviewProvider {
//    static var landmarks = ModelData().landmarks
//
//    static var previews: some View {
//        Group {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
