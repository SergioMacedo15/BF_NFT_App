//
//  WalletViewModel.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 12/06/23.
//

import UIKit

enum typeCellWallet: Int{
    case quotationEthereum = 0
    case latestTransactionsCell = 1
}


protocol WalletViewModelProtocol: AnyObject{
    func sucess()
    func failure()
}

class WalletViewModel {

    private let services : WalletServices = WalletServices()
    private var WalletData : WalletData?
    private var delegate: WalletViewModelProtocol?
    
    public func delegate(delegate: WalletViewModelProtocol?){
        self.delegate = delegate
    }
    
    public func fetchRequest(typeFetch: typeFetch ){
        switch typeFetch{
        case .mock:
            services.getWalletFromJason { result, failure in
                if result != nil {
                    self.WalletData = result
                    self.delegate?.sucess()
                } else{
                    self.delegate?.failure()
                }
            }
        case .request:
            services.getWallet { result, failure in
                if result != nil {
                    self.WalletData = result
                    self.delegate?.sucess()
                } else{
                    self.delegate?.failure()
                }
            }
        }
    }
    
    public var numberOfRowsInSection : Int {
        2
    }
    
    public var getQuotationEth : QuotationEthereum{
        WalletData?.quotationEthereum ?? QuotationEthereum()
    }
    
    public var latestTransactions : LatestTransactionsCell{
        WalletData?.latestTransactionsCell ?? LatestTransactionsCell()
    }
    
    public func selectCell(indexPath: IndexPath, tableView: UITableView, delegate: WalletVC) -> UITableViewCell{
        
        switch typeCellWallet(rawValue: indexPath.row){
        
        case .quotationEthereum:
            let cell = tableView.dequeueReusableCell(withIdentifier: QuotationEthTableViewCell.identifier, for: indexPath) as? QuotationEthTableViewCell
            cell?.setupCell(data: getQuotationEth)
            return cell ?? UITableViewCell()
            
        case .latestTransactionsCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: LastetTransactionTableViewCell.identifier, for: indexPath) as? LastetTransactionTableViewCell
            cell?.setupCell(data: latestTransactions)
            return cell ?? UITableViewCell()

        default:
            return UITableViewCell()
        }
    }
    
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat{
        switch typeCellWallet(rawValue: indexPath.row){
        case .quotationEthereum:
            return 250
        case .latestTransactionsCell:
            return heightLastetTransaction.height.rawValue * CGFloat(self.latestTransactions.listOfTransactions?.count ?? 0) + 75
        default:
            return CGFloat()
        }
        
    }
    
}
