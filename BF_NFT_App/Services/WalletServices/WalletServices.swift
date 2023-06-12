//
//  HomeServices.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 07/06/23.
//

import UIKit
import Alamofire

protocol WalletServicesDelegate: GenericServices {
    func getWalletFromJason(completion: @escaping completion<WalletData?>)
    func getWallet(completion: @escaping completion<WalletData?>)
}

class WalletServices: WalletServicesDelegate {
    
    //MARK: USANDO REQUISIÇÃO COM ALAMOFIRE
    func getWallet(completion: @escaping completion<WalletData?>) {
        let url : String = "https://run.mocky.io/v3/ee619d8e-87ac-466e-846e-8b7318d16b50"
        AF.request(url,method: .get).validate(statusCode: 200...299).responseDecodable(of: WalletData.self) { response in
            debugPrint(response)
            switch response.result{
            case .success(let sucess):
                print("Sucess")
                completion(sucess, nil)
            case .failure(let error):
                print("Error")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    //MARK: USANDO REQUISIÇÃO VINDA DE UM MOCK
    func getWalletFromJason(completion: @escaping completion<WalletData?>) {
        if let url = Bundle.main.url(forResource: "WalletData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let WalletData: WalletData = try JSONDecoder().decode(WalletData.self, from: data)
                completion(WalletData ,nil)
            }catch{
                completion(nil,Error.fileDecodingFailed(name: "WalletData", error))
            }
        } else {
            completion(nil,Error.fileNotFound(name: "WalletData"))
        }
        
    }
    
}
