//
//  LastetDealTableViewCellViewModel.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 11/06/23.
//

import UIKit

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
    public func loadCurrentCell(indexPath: IndexPath) -> LatestDeal{
        return NFT?.latestDeals?[indexPath.row] ?? LatestDeal()
    }
    public var heigthForRowAt: CGFloat {
        70 
    }

    
}
