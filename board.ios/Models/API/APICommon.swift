//
//  APICommon.swift
//  board.ios
//
//  Created by DETION on 2022/06/18.
//

import Foundation
import Alamofire
import SwiftyJSON

class API{
    
    static let share: API = API()
    
    func request<T: Codable>(_ APIConstant: (URL: String, Method: HTTPMethod), _ params: [String: Any], _ completion : @escaping (T) -> Void){

        AF.request(APIConstant.URL,
                   method: APIConstant.Method,
                   parameters: params,
                   encoding: APIConstant.Method == .get ? URLEncoding.default : JSONEncoding.prettyPrinted,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"]).responseDecodable{ (response: DataResponse<T, AFError>) in
            
        switch response.result {
            
            case .success(let result):
                completion(result)
            case .failure(let error):
                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
        
    }
    
}
