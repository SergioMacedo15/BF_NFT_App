//
//  DetailsViewModel.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 10/06/23.
//

import UIKit

enum typeCell: Int{
    case ImageCell = 0
    case Description = 1
}


class DetailsViewModel: NSObject {
    
    private var NFT : Nft?
    
    public func setDetailsNFT(data: Nft){
        self.NFT = data
    }

    public func getDetailsNFT() -> Nft{
        return NFT ?? Nft()
    }
    
    public var numberOfRowsInSection : Int{
        2
    }
    
    public func selectCell(indexPath: IndexPath, tableView: UITableView, delegate: DetailsVC) -> UITableViewCell{
        
        switch typeCell(rawValue: indexPath.row){
        
        case .ImageCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftImageTableViewCell.identifier, for: indexPath) as? NftImageTableViewCell
            cell?.setupCell(url: self.getDetailsNFT().nftImage ?? "", delegate: delegate)
            return cell ?? UITableViewCell()
            
        case .Description:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftDescriptionTableViewCell.identifier, for: indexPath) as? NftDescriptionTableViewCell
            cell?.setupCell(id: self.getDetailsNFT().nftID ?? 0 , title: self.getDetailsNFT().titleLatestDeals ?? "", description: self.getDetailsNFT().nftDescription ?? "")
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
        
    }

    public func heightForRowAt(indexPath: IndexPath) -> CGFloat{
        switch typeCell(rawValue: indexPath.row){
        case .ImageCell:
            return 400
        case .Description:
            return 200
        default:
            return CGFloat()
        }
        
    }
    
}
