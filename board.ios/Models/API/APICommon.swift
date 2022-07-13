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

        
        var url = APIConstant.URL
        
        if APIConstant.Method == .get {
            url = url + "?"
            
            var aa:Int = 1
            
            for (key,value) in params {
                aa = aa + 1
                print(key, value)
                url += "\(key)=\(value)&"
            }
            print(aa)
        }
        
        print("\n\n API Request -> \(url)\n\n")

        
        AF.request(url,
                   method: APIConstant.Method,
                   parameters: APIConstant.Method == .get ? nil : params,
                   encoding: APIConstant.Method == .get ? URLEncoding.default : JSONEncoding.prettyPrinted,
                   headers: ["Content-Type":"application/json", "Accept":"application/json"]).responseDecodable{ (response: DataResponse<T, AFError>) in
            
        switch response.result {
            case .success(let result):
            print("\n\n API Respnse \n \(result) \n\n")
            
                completion(result)
            case .failure(let error):
                print("\nAlamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)\n")
            }
        }
        
    }
    
}
