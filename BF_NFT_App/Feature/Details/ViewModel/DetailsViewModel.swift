//
//  DetailsViewModel.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 10/06/23.
//

import UIKit

enum typeCellDetails: Int{
    case ImageCell = 0
    case Description = 1
    case LastetDeals = 2
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
        3
    }
    
    public func selectCell(indexPath: IndexPath, tableView: UITableView, delegate: DetailsVC) -> UITableViewCell{
        
        switch typeCellDetails(rawValue: indexPath.row){
        
        case .ImageCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftImageTableViewCell.identifier, for: indexPath) as? NftImageTableViewCell
            cell?.setupCell(url: self.getDetailsNFT().nftImage ?? "", delegate: delegate)
            return cell ?? UITableViewCell()
            
        case .Description:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftDescriptionTableViewCell.identifier, for: indexPath) as? NftDescriptionTableViewCell
            cell?.setupCell(id: self.getDetailsNFT().nftID ?? 0 , title: self.getDetailsNFT().titleLatestDeals ?? "", description: self.getDetailsNFT().nftDescription ?? "")
            return cell ?? UITableViewCell()

        case .LastetDeals :
            let cell = tableView.dequeueReusableCell(withIdentifier: LastetDealTableViewCell.identifier, for: indexPath) as? LastetDealTableViewCell
            cell?.setupCell(data: self.getDetailsNFT())
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }

    public func heightForRowAt(indexPath: IndexPath, Width: CGFloat) -> CGFloat{
        switch typeCellDetails(rawValue: indexPath.row){
        case .ImageCell:
            return 400
        case .Description:
            return (getDetailsNFT().nftDescription?.height(withConstrainedWidth: Width, font: UIFont.systemFont(ofSize: 18)) ?? 0) + 89
        case.LastetDeals:
            return heigthLastetDeal.height.rawValue * CGFloat(getDetailsNFT().latestDeals?.count ?? 0) + 75
        default:
            return CGFloat()
        }
        
    }
    
}
