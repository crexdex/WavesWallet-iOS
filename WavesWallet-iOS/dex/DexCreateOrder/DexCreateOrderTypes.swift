//
//  DexSellBuyTypes.swift
//  WavesWallet-iOS
//
//  Created by Pavel Gubin on 9/8/18.
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import Foundation

enum DexCreateOrder {
    enum DTO {}
    enum ViewModel {}
    
}

extension DexCreateOrder.ViewModel {
    
}

extension DexCreateOrder.DTO {
  
    enum OrderType {
        case sell
        case buy
    }
    
    struct Asset {
        let id: String
        let name: String
    }
    
    struct Input {
        let priceAsset: Asset
        let amountAsset: Asset
        let type: OrderType
        let price: Money
    }
}
