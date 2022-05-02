//
//  UserDataListView.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import SwiftUI

struct UserDataListView: View{
    
    let userData: UserData
    
    //    let rowColor: Color = Color(UIColor(red: 0, green: 7, blue: 44, alpha: 1))
    //
    //    let backgroundColor: Color = Color(UIColor(red: 1, green: 0, blue: 1, alpha: 1))
    
    var body: some View{
        NavigationView{
            VStack {
                Text("THE STAR CLUB")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                Divider()
                
                VStack{
                    HStack{
                        VStack{
                            Text("Welcome Back")
                                .foregroundColor(Color.white)
                            Spacer()
                            Text(userData.name)
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                        Image("profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100, alignment: .top)
                        
                        
                    }
                    .frame(height:100)
                }.padding()
                
                Spacer()
                
                //                BENEFITS
                
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
                                .frame(width: 100, height: 100, alignment: .leading)
                            
                            //                            Spacer()
                            
                        }.padding()
                            .frame(height:120)
                            .background(Color.blue)
                            .cornerRadius(20)
                        
                        
                    }
                }
                
//                Spacer()
                
                VStack{
                    NavigationLink(destination: ExtendableScreenView()) {
                        HStack{
                            VStack{
                                Text("TIER POINTS")
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                Text("The Current Balance")
                                    .font(.footnote)
                                    .scaledToFit()
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                Text("\(userData.tierPoints)")
                                    .foregroundColor(Color.white)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            //                            Spacer()
                            VStack{
                                Text("TIER POINTS TO SILVER")
                                    .foregroundColor(Color.white)
                                
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                
                                Spacer()
                                Text("0")
                                    .bold()
                                    .scaledToFit()
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(10)
                            }
                            
                        }.padding()
                            .frame(height:120)
                            .background(Color.blue)
                            .cornerRadius(20)
                        
                    }
                    
                }
                
//                Spacer()
                
                VStack{
                    NavigationLink(destination: ExtendableScreenView()) {
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
                            .frame(height:120)
                            .background(Color.blue)
                            .cornerRadius(20)
                        
                    }
                    
                    
                }
            
    
                VStack{
                    NavigationLink(destination: ExtendableScreenView()) {
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
                            .frame(height:120)
                            .background(Color.blue)
                            .cornerRadius(20)

                    }
                }
            
            }
            .background(Color("backgrounColor"))
            
        }
        
        
    }
    

    
}



struct UserDataListView_Previews: PreviewProvider {
    static var previews: some View {
        
        UserDataListView(userData: UserDataFetch.successtate().userData!)
    }
}
