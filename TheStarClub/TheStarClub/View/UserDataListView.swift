//
//  UserDataListView.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import SwiftUI

struct UserDataListView: View{
    
    let userData: UserData

    
    var body: some View{
        VStack{
            HStack{
                VStack{
                    Text("Welcome Back")
                    Spacer()
                    Text(userData.name)
                        .font(.largeTitle)
                }
                
                Spacer()
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .top)
                
                
            }.padding()
                .frame(height:100)
        }
        
        
        NavigationView{
            
            VStack(alignment: .center, spacing: 0, content:{
                VStack{
                    NavigationLink(destination: BenefitsListView())
                    {
                        
                        HStack{
                            Text(userData.tier)
                                .foregroundColor(Color.white)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Image("diamond")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100, alignment: .center)
                            
                            Spacer()
                            
                        }.padding()
                            .background(Color.blue)
                            .cornerRadius(20)
                        
                        
                    }
                }
                .padding()
                
                VStack{
                    NavigationLink(destination: LoadingView()) {
                        HStack{
                            VStack{
                                Text("TIER POINTS")
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                Text("The Current Balance")
                                    .font(.footnote)
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                Text("\(userData.tierPoints)")
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Spacer()
                            VStack{
                                Text("TIER POINTS TO SILVER")
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                Spacer()
                                Text("0")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(10)
                            }
                            
                        }.padding()
                            .background(Color.blue)
                            .cornerRadius(20)
                        
                    }
                    
                }
                
                .padding()
                
                VStack{
                    NavigationLink(destination: LoadingView()) {
                        HStack{
                            VStack{
                                Text("STAR GIFTS")
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                Text("EXPLORE GIFTS YOU CAN EARN AT SILVER")
                                    .font(.subheadline)
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                            }
                            Spacer()
                            
                            
                        }.padding()
                            .background(Color.blue)
                            .cornerRadius(20)
                        
                    }
                    
                }
                
                .padding()
                
                VStack{
                    NavigationLink(destination: LoadingView()) {
                        HStack{
                            VStack{
                                Text("CASINO DOLLARS BALANCE")
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                Text("$ \(userData.casinoDollars)")
                                    .font(.subheadline)
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                            }
                            Spacer()
                            
                            
                        }.padding()
                            .background(Color.blue)
                            .cornerRadius(20)
                        
                    }
                }
                .padding()
                
            })
        }
        
    }
    
}



struct UserDataListView_Previews: PreviewProvider {
    static var previews: some View {
        
        UserDataListView(userData: UserDataFetch.successtate().userData!)
    }
}
