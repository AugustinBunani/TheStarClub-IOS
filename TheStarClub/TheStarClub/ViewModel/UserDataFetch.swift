//
//  UserDataFetch.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import Foundation

class UserDataFetch: ObservableObject {
    
    @Published var userData: UserData?
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    
    init()
    {
        fetchAllUserData()
    }
//
    func fetchAllUserData()
    {
        
        isLoading = true
        errorMessage = nil
        let url = URL(string: "https://run.mocky.io/v3/c1819867-9260-4d1e-b9e1-3a77372c83df")
        
        let service = APIService()
        service.fetchUserData(url: url){ [unowned self] result in
            
            DispatchQueue.main.async { [self] in
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                    
                case .success(let results):
                    userData = results
                    
                }
            }
        }
    }
    
    //Mark: Preview Helpers
    static func errorState() -> UserDataFetch {
        let fetcher = UserDataFetch()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successtate() -> UserDataFetch {
        let fetcher = UserDataFetch()
        fetcher.userData = UserData.example1()
        return fetcher
    }
}
