//
//  BenefitsData.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import Foundation


// MARK: - Benefit
struct Benefit: Codable {
    let name, expireDate: String
}

// MARK: - Welcome
struct BenefitsData: Codable, Identifiable
{
    let id = UUID()
    
    let benefits: [Benefit]

    init(benefits:[Benefit]){
        
        self.benefits = benefits
        
    }
    
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = UUID()
        benefits = try values.decode([Benefit].self, forKey: .benefits)

    }
    
    static func example1() -> BenefitsData{
        return BenefitsData(benefits: [Benefit(name: "Augustin", expireDate: "19/02/2039")])
    }
    
    
}
