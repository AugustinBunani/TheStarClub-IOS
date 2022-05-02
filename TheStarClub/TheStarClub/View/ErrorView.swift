//
//  ErrorView.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import SwiftUI
import Foundation

struct ErrorView: View {
    @ObservedObject var userDataFetcher: UserDataFetch
    
    var body: some View{
        
        VStack{
            Text("Error!").font(.system(size: 20))
            Text(userDataFetcher.errorMessage ?? "")
            Button{
                userDataFetcher.fetchAllUserData()
            } label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(userDataFetcher: UserDataFetch())
    }
}
