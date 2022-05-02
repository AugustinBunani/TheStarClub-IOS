//
//  UserData.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import Foundation

struct UserData: Codable,CustomStringConvertible{
    
    
//    var id: ObjectIdentifie
    let tierPoints: Int
    let casinoDollars: Int
    let name: String
    let tier: String
    
    
    var description: String{
        return "Name \(name), Tier: \(tier), TierPoints: \(tierPoints), CasinoDollars: \(casinoDollars)"
    }
    
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        tier = try values.decode(String.self, forKey: .tier)
        name = try values.decode(String.self, forKey: .name)
        casinoDollars = try values.decode(Int.self, forKey: .casinoDollars)
        tierPoints = try values.decode(Int.self, forKey: .tierPoints)

    }
    
    init(name:String, tier: String, tierPoints: Int,casinoDollars:Int){
        
        self.name = name
        self.tier = tier
        self.tierPoints = tierPoints
        self.casinoDollars = casinoDollars
        
    }
    
    static func example1() -> UserData{
        return UserData(name: "Augustin",
                        tier: "Silver",
                        tierPoints: 8000,
                        casinoDollars: 100000)
    }
    
}
