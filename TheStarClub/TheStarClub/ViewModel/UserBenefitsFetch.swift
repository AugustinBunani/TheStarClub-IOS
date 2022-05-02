//
//  UserBenefitsFetch.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import Foundation

class UserBenefitsFetch: ObservableObject {
    
    @Published var userBenefits: BenefitsData?
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    
    init()
    {
        fetchAllBenefits()
    }

    func fetchAllBenefits()
    {
        
        isLoading = true
        errorMessage = nil
        let url = URL(string: "https://run.mocky.io/v3/6bd03c3d-8b70-40fe-b26c-36bfc03296ff")
        
        let service = APIService()
        service.fetchUserBenefits(url: url){ [unowned self] result in
            
            DispatchQueue.main.async { [self] in
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                    
                case .success(let results):
                    userBenefits = results
                    
                }
            }
        }
    }
    
    //Mark: Preview Helpers
    static func errorState() -> UserBenefitsFetch {
        let fetcher = UserBenefitsFetch()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successtate() -> UserBenefitsFetch {
        let fetcher = UserBenefitsFetch()
        fetcher.userBenefits = BenefitsData.example1()
        return fetcher
    }
}

