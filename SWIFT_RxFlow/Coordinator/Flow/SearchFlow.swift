//
//  SearchFlow.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/19/23.
//

import Foundation

import RxSwift
import RxFlow

class SearchFlow: Flow {
    let viewModel: SearchViewModel
    let navigationController = UINavigationController()
    
    var root: RxFlow.Presentable {
        self.navigationController
    }
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppSteps else {return .none}
        
        switch step {
        case .search:
            let vc = SearchVC(viewModel: self.viewModel)
            self.navigationController.pushViewController(vc, animated: true)
            
            return .none
            
        case .home:
            return .one(flowContributor: .forwardToParentFlow(withStep: AppSteps.home))
        default:
            return .none
        }
    }
    
    
}
