//
//  ApiService.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import Foundation

struct APIService{
    
    func fetchData<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void)
    {

        guard let url = url else{
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let error = error as? URLError{
                completion(Result.failure(APIError.url(error)))
            }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode){
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data{
                
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                }catch{
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
            
        }
        task.resume()
    
    }
    
//    func fetchUserData(url: URL?, completion: @escaping(Result<UserData, APIError>) -> Void)
//    {
//        
//        guard let url = url else{
//            let error = APIError.badURL
//            completion(Result.failure(error))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url){
//            data, response, error in
//            
//            if let error = error as? URLError{
//                completion(Result.failure(APIError.url(error)))
//            }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode){
//                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
//            }else if let data = data{
//                
//                let decoder = JSONDecoder()
//                
//                do {
//                    let user_data = try decoder.decode(UserData.self, from: data)
//                    completion(Result.success(user_data))
//                    
//                }catch{
//                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
//                }
//            }
//            
//        }
//        task.resume()
//        
//    }
    
//    func fetchUserBenefits(url: URL?, completion: @escaping(Result<BenefitsData, APIError>) -> Void)
//    {
//        
//        guard let url = url else{
//            let error = APIError.badURL
//            completion(Result.failure(error))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url){
//            data, response, error in
//            
//            if let error = error as? URLError{
//                completion(Result.failure(APIError.url(error)))
//            }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode){
//                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
//            }else if let data = data{
//                
//                let decoder = JSONDecoder()
//                
//                do {
//                    let user_benefits = try decoder.decode(BenefitsData.self, from: data)
//                    completion(Result.success(user_benefits))
//                    
//                }catch{
//                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
//                }
//            }
//            
//        }
//        task.resume()
//        
//    }
    
}


