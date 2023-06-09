//
//  HomeServices.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 07/06/23.
//

import UIKit
import Alamofire

protocol HomeServicesDelegate: GenericServices {
    func getHomeFromJason(completion: @escaping completion<NFTdata?>)
    func getHome(completion: @escaping completion<NFTdata?>)
}

class HomeServices: HomeServicesDelegate {
    
    //MARK: USANDO REQUISIÇÃO COM ALAMOFIRE
    func getHome(completion: @escaping completion<NFTdata?>) {
        let url : String = "https://run.mocky.io/v3/2bf03453-848f-4514-9e43-32c64318d631"
        AF.request(url,method: .get).validate(statusCode: 200...299).responseDecodable(of: NFTdata.self) { response in
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
    func getHomeFromJason(completion: @escaping completion<NFTdata?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let NFTdata: NFTdata = try JSONDecoder().decode(NFTdata.self, from: data)
                completion(NFTdata ,nil)
            }catch{
                completion(nil,Error.fileDecodingFailed(name: "HomeData", error))
            }
        } else {
            completion(nil,Error.fileNotFound(name: "HomeData"))
        }
        
    }
    
}
