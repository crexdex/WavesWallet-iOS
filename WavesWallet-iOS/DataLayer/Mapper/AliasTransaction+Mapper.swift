//
//  AliasTransaction+Mapper.swift
//  WavesWallet-iOS
//
//  Created by mefilt on 30.08.2018.
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import Foundation

extension AliasTransaction {

    convenience init(transaction: DomainLayer.DTO.AliasTransaction) {
        self.init()
        type = transaction.type
        id = transaction.id
        sender = transaction.sender
        senderPublicKey = transaction.sender
        fee = transaction.fee
        timestamp = transaction.timestamp
        version = transaction.version
        height = transaction.height
        modified = transaction.modified

        signature = transaction.signature
        alias = transaction.alias
    }
}

extension DomainLayer.DTO.AliasTransaction {

    init(transaction: Node.DTO.AliasTransaction) {

        type = transaction.type
        id = transaction.id
        sender = transaction.sender
        senderPublicKey = transaction.sender
        fee = transaction.fee
        timestamp = transaction.timestamp
        version = transaction.version
        height = transaction.height
        modified = Date()

        signature = transaction.signature
        alias = transaction.alias
    }

    init(transaction: AliasTransaction) {
        type = transaction.type
        id = transaction.id
        sender = transaction.sender
        senderPublicKey = transaction.sender
        fee = transaction.fee
        timestamp = transaction.timestamp
        version = transaction.version
        height = transaction.height
        modified = transaction.modified

        signature = transaction.signature
        alias = transaction.alias
    }
}
