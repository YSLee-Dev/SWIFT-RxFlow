//
//  DetailFlow.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/19/23.
//

import UIKit

import RxSwift
import RxCocoa
import RxFlow

class DetailFlow: Flow {
    let navigationController: UINavigationController
    let viewModel: DetailViewModel
    
    var root: RxFlow.Presentable {
        self.navigationController
    }
    
    init(
        navigationController: UINavigationController,
        viewModel: DetailViewModel
    ) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppSteps else {return .none}
        
        switch step {
        case .detail(_):
            let vc = DetailVC(viewModel: viewModel)
            self.navigationController.pushViewController(vc, animated: true)
            
            return .none
            
        case .detailComplete(let type):
            switch type {
            case .home:
                return .one(flowContributor: .forwardToParentFlow(withStep: AppSteps.search))
            case .search:
                return .one(flowContributor: .forwardToParentFlow(withStep: AppSteps.home))
            default :
                return .end(forwardToParentFlowWithStep: AppSteps.detailComplete(type: .none))
            }
        default:
            return .none
        }
    }
}
