//
//  LeasingTransactionRemote.swift
//  WavesWallet-iOS
//
//  Created by Prokofev Ruslan on 05/08/2018.
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import Foundation
import RxSwift
import Moya

final class LeasingTransactionRepositoryRemote: LeasingTransactionRepositoryProtocol {

    private let leasingProvider: MoyaProvider<Node.Service.Leasing> = .init(plugins: [SweetNetworkLoggerPlugin(verbose: true)])

    func activeLeasingTransactions(by accountAddress: String) -> AsyncObservable<[DomainLayer.DTO.LeaseTransaction]> {
        return leasingProvider
            .rx
            .request(.getActive(accountAddress: accountAddress), callbackQueue: DispatchQueue.global(qos: .background))
            .map([Node.DTO.LeaseTransaction].self)
            .map { $0.map { DomainLayer.DTO.LeaseTransaction(transaction: $0) } }
            .asObservable()
    }

    func saveLeasingTransactions(_ transactions:[DomainLayer.DTO.LeaseTransaction]) -> Observable<Bool> {
        assert(true, "Method don't supported")
        return Observable.never()
    }
    
    func saveLeasingTransaction(_ transaction: DomainLayer.DTO.LeaseTransaction) -> Observable<Bool> {
        assert(true, "Method don't supported")
        return Observable.never()
    }
}
