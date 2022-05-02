//
//  ExtendableScreenView.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import Foundation
import SwiftUI

struct ExtendableScreenView: View{
    
    var body: some View{
        
        VStack {
            Text("😢")
                .font(.title)
            Text("Screen To Be Constructed Later")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backgrounColor"))
        
    }
}


struct ExtendableScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ExtendableScreenView()
    }
}
