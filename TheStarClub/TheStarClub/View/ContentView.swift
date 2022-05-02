//
//  ContentView.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userDataFetch = UserDataFetch()
    
    var body: some View {
        
        if userDataFetch.isLoading{
            LoadingView()
        }else if userDataFetch.errorMessage != nil{
            ErrorView(userDataFetcher: userDataFetch)
        }else{
            UserDataListView(userData: userDataFetch.userData!)
        }
     
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
