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
                    self.NFTData = result
                    self.delegate?.sucess()
                } else{
                    self.delegate?.failure()
                }
            }
        case .request:
            services.getHome { result, failure in
                if result != nil {
                    self.NFTData = result
                    self.delegate?.sucess()
                } else{
                    self.delegate?.failure()
                }
            }
        }
    }
    
    public var collectionViewNumberOfItens : Int {
        NFTData?.filterNft?.count ?? 0
    }
    
    public func loadCurrentFilterNFT(indexPath : IndexPath) -> FilterNft{
        return NFTData?.filterNft?[indexPath.row] ?? FilterNft() 
    }
    
    public func sizeforItemFilterNFT() -> CGSize {
        return CGSize(width: 100, height:  34 )
    }
    
    
    
    
    
}
