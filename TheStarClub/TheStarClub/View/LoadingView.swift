//
//  LoadingView.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    
    var body: some View{
        VStack{
            Text("Loading").font(.system(size: 20))
            ProgressView()
        }
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
