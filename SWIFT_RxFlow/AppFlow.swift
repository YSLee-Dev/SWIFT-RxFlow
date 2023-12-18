//
//  AppFlow.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/18/23.
//

import Foundation

import RxSwift
import RxFlow

class AppFlow: Flow {
    let window: UIWindow!
    
    var root: RxFlow.Presentable {
        self.window
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppSteps else { return .none }
        
        switch step {
        case .home:
            let mainViewModel = MainViewModel()
            let mainFlow = MainFlow(viewModel: mainViewModel)
            
            Flows.use(mainFlow, when: .created) { root in
                self.window.rootViewController = root
            }
            
            return .one(flowContributor: .contribute(withNextPresentable: mainFlow, withNextStepper: mainViewModel))
            
        case .detail(_):
            return .none
        }
    }
    
    
}
