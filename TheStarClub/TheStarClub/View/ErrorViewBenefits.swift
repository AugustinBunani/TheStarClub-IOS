//
//  ErrorViewBenefits.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import SwiftUI


import SwiftUI
import Foundation

struct ErrorViewBenefits: View {
    @ObservedObject var userBenefitsFetch: UserBenefitsFetch
    
    var body: some View{
        
        VStack{
            Text("Error!").font(.system(size: 20))
            Text(userBenefitsFetch.errorMessage ?? "")
            Button{
                userBenefitsFetch.fetchAllBenefits()
            } label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorViewBenefits_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(userDataFetcher: UserDataFetch())
    }
}

