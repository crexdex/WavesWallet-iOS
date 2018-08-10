//
//  DexMarketModuleBuilder.swift
//  WavesWallet-iOS
//
//  Created by Pavel Gubin on 8/9/18.
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import UIKit

struct DexMarketModuleBuilder: ModuleBuilder {
    
    func build(input: Void) -> UIViewController {
        
        let vc = StoryboardScene.Dex.dexMarketViewController.instantiate()
        var presenter: DexMarketPresenterProtocol = DexMarketPresenter()
        presenter.interactor = DexMarketInteractorMock()
        vc.presenter = presenter
        
        return vc
    }
}