//
//  GenericServices.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 07/06/23.
//

import UIKit
import Alamofire

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorRequest(AFError)
}


protocol GenericServices{
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
