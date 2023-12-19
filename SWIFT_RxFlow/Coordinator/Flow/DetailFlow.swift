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
            
        case .detailComplete:
            return .end(forwardToParentFlowWithStep: AppSteps.detailComplete)
            
        default:
            return .none
        }
    }
}
