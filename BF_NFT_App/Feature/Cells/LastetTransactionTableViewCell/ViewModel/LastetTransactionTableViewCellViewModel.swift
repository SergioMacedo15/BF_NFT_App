//
//  LastedTransactionTableViewCellViewModel.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 12/06/23.
//

import UIKit

enum heightLastetTransaction : CGFloat {
    case height = 70
}

class LastetTransactionTableViewCellViewModel {

    private var listOfTransactions : [ListOfTransaction]?
    
    public func setLastTransactionData(listOfTransactions: [ListOfTransaction]){
        self.listOfTransactions = listOfTransactions
    }
    
    public var numberOfRowsInSection : Int {
        listOfTransactions?.count ?? 0
    }
    
    public func isInitial(_ indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }
    
    public func isFinal(_ indexPath: IndexPath) -> Bool {
        return indexPath.row == numberOfRowsInSection - 1
    }
    
    public func loadCurrentTransaction(indexPath: IndexPath) -> ListOfTransaction{
        return listOfTransactions?[indexPath.row] ?? ListOfTransaction()
    }
    
    public var heightForRowAt : CGFloat {
        heightLastetTransaction.height.rawValue
    }
    
}
