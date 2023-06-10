//
//  DetailsViewModel.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 10/06/23.
//

import UIKit

class DetailsViewModel: NSObject {

    private var DetailsNFT : Nft?
    
    public func setDetailsNFT(data: Nft){
        self.DetailsNFT = data
    }
}
