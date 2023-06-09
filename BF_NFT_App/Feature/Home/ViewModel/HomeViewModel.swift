//
//  HomeViewModel.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 07/06/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject{
    func sucess()
    func failure()
}
class HomeViewModel{
    
    private let services : HomeServices = HomeServices()
    private var NFTData : NFTdata?
    private var delegate : HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol?){
        self.delegate = delegate
    }
    
    public func fetchRequest(typeFetch: typeFetch ){
        switch typeFetch{
        case .mock:
            services.getHomeFromJason { result, failure in
                if result != nil {
                    print("sucess")
                    self.delegate?.sucess()
                } else{
                    print("failure")
                    self.delegate?.failure()
                }
            }
        case .request:
            services.getHome { result, failure in
                if result != nil {
                    print("Sucess")
                    self.delegate?.sucess()
                } else{
                    print("Failure")
                    self.delegate?.failure()
                }
            }
        }
    }
}
