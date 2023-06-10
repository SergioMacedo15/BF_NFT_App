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
    private var SearchNFTData : NFTdata?
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
                    self.SearchNFTData = result
                    self.delegate?.sucess()
                } else{
                    self.delegate?.failure()
                }
            }
        case .request:
            services.getHome { result, failure in
                if result != nil {
                    self.NFTData = result
                    self.SearchNFTData = result
                    self.delegate?.sucess()
                } else{
                    self.delegate?.failure()
                }
            }
        }
    }
    
    //MARK: CollectionViewSection
    
    public var collectionViewNumberOfItens : Int {
        SearchNFTData?.filterNft?.count ?? 0
    }
    
    public func loadCurrentFilterNFT(indexPath : IndexPath) -> FilterNft{
        return SearchNFTData?.filterNft?[indexPath.row] ?? FilterNft()
    }
    
    public func sizeforItemFilterNFT() -> CGSize {
        return CGSize(width: 100, height:  34 )
    }
    
    //MARK: TableViewSection
    
    public var tableViewNumberOfItens : Int {
        SearchNFTData?.nftList?.count ?? 0
    }
    
    public func loadCurrentNftList(indexPath : IndexPath) -> Nft{
        return SearchNFTData?.nftList?[indexPath.row] ?? Nft()
    }
    
    public func heightForRowAtNftList () -> CGFloat {
        return 360
    }
    
    //MARK: SEARCH Seaction
    
    var typeFilter : Int? {
        return SearchNFTData?.filterNft?.first(where: {$0.isSelected == true})?.id
    }

    public func filterSearchList(_ text: String){
        
        var nftList : [Nft] = [ ]
        
        if typeFilter == 0 {
            nftList = NFTData?.nftList ?? []
        } else {
            nftList = NFTData?.nftList?.filter({$0.type == typeFilter ?? 0}) ?? [ ]
        }
            if text.isEmpty {
                SearchNFTData?.nftList = nftList
            } else {
                SearchNFTData?.nftList = nftList.filter({ nft in
                    return nft.userName?.lowercased().contains(text.lowercased()) ?? false
                })
            }
    }
    
    public func setFilter(Searchtext: String, indexPath: IndexPath){
        var ListNFT : [FilterNft] = []
        for (index, value) in (SearchNFTData?.filterNft ?? []).enumerated(){
            var type = value
            if index == indexPath.row {
                type.isSelected = true
            } else {
                type.isSelected = false
            }
            ListNFT.append(type)
        }
        SearchNFTData?.filterNft = ListNFT
        filterSearchList(Searchtext)
    }
}
