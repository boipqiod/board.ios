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
    
    
    func test<T>(_ completion : @escaping (BaseResponse<T>) -> Void){
        
        let url = APIConstant.share.SIGNIN.URL
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = APIConstant.share.SIGNIN.Method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST 로 보낼 정보
        let params = ["email":"boipqiod@naver.com", "password":"1234"] as Dictionary

        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseDecodable{ (response: DataResponse<BaseResponse<T>, AFError>) in
            
            
            print(response)
            
            switch response.result {
        case .success(let result):

                print("result \(result)")

                print("POST 성공")

                do{
                    let result = try JSONDecoder().decode(BaseResponse<T>.self, from: response.data!)

                    completion(result)
                }
                catch(let e){
//                    print(e)
                }

                print(response)
            case .failure(let error):
                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
        
    }
    

    func request(_ method: String, _ body: BaseRequest){
        
        
        let url = APIConstant.share.SIGNIN.URL
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = APIConstant.share.SIGNIN.Method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST 로 보낼 정보
        let params = ["email":"boipqiod@naver.com", "password":"1234"] as Dictionary

        // httpBody 에 parameters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("POST 성공")
            case .failure(let error):
                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
        
    }
}
