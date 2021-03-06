//
//  BenefitsListView.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import SwiftUI

struct BenefitsListView: View {
    
    //    let benefits: Benefit
    @StateObject var userBenefitsFetch = UserBenefitsFetch()
    
    var body: some View {
        
        if userBenefitsFetch.isLoading{
            LoadingView()
        }else if userBenefitsFetch.errorMessage != nil{
            ErrorViewBenefits(userBenefitsFetch: userBenefitsFetch)
        }else{
            
            NavigationView{
                VStack {
                    Text("BENEFITS")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                    Divider()
                    
                    ForEach(userBenefitsFetch.userBenefits!.benefits, id: \.name) { benefit in
                        
                        HStack{
                            
                            VStack{
                                Text("Benefit")
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                //                            Spacer()
                                Text(benefit.name)
                                    .font(.footnote)
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                            VStack{
                                Text("Expire Date")
                                    .foregroundColor(Color.red)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                Text(benefit.expireDate)
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                        
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                    }
                    .padding()
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("backgrounColor"))
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("backgrounColor"))
            
        }
    }
}

struct BenefitsListView_Previews: PreviewProvider {
    static var previews: some View {
        BenefitsListView()
    }
}
