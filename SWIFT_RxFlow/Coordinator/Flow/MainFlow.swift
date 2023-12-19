//
//  MainFlow.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/18/23.
//

import Foundation

import RxSwift
import RxFlow

class MainFlow: Flow {
    let viewModel: MainViewModel
    let navigationController = UINavigationController()
    
    var root: RxFlow.Presentable {
        self.navigationController
    }
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppSteps else { return .none }
        
        switch step {
        case .home:
            return self.homeVCPresent()
        case .search:
            return .one(flowContributor: .forwardToParentFlow(withStep: AppSteps.search))
        default:
            return .none
        }
    }
}

private extension MainFlow {
    func homeVCPresent() -> FlowContributors {
        let vc = MainVC(viewModel: viewModel)
        self.navigationController.pushViewController(vc, animated: true)
        
        return .none
    }
}
