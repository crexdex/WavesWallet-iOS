//
//  DexTraderContainerModuleBuilder.swift
//  WavesWallet-iOS
//
//  Created by Pavel Gubin on 8/15/18.
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import UIKit

struct DexTraderContainerModuleBuilder: ModuleBuilderOutput {
    
    var output: DexTraderContainerModuleOutput
    
    func build(input: DexTraderContainer.DTO.Pair) -> UIViewController {
        let vc = StoryboardScene.Dex.dexTraderContainerViewController.instantiate()
        vc.pair = input
        vc.moduleOutput = output
        
        
        vc.addViewController(DexOrderBookModuleBuilder().build(input: input), isScrollEnabled: true)
        vc.addViewController(DexChartModuleBuilder().build(input: input), isScrollEnabled: false)
        vc.addViewController(DexLastTradesModuleBuilder().build(input: input), isScrollEnabled: true)
        vc.addViewController(DexMyOrdersModuleMuilder().build(input: input), isScrollEnabled: true)
        return vc
    }
}
