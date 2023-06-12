//
//  LastetDealTableViewCellViewModel.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 11/06/23.
//

import UIKit

enum heigthLastetDeal : CGFloat {
    case height = 80
}

class LastetDealTableViewCellViewModel {
    
    private var NFT : Nft?
    
    public func setNfT(data: Nft){
        self.NFT = data
    }
    
    public var getNft : Nft? {
        NFT
    }
    
    public var numberOfRowsInSection : Int {
        NFT?.latestDeals?.count ?? 0
    }
    
    public func loadCurrentCell(_ indexPath: IndexPath) -> LatestDeal{
        return NFT?.latestDeals?[indexPath.row] ?? LatestDeal()
    }
    
    public func isInitial(_ indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }
    
    public func isFinal(_ indexPath: IndexPath) -> Bool {
        return indexPath.row == numberOfRowsInSection - 1
    }
    
    
    public var heigthForRowAt: CGFloat {
        heigthLastetDeal.height.rawValue
    }

    
}
