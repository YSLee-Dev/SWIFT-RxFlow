//
//  SettingFlow.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/20/23.
//

import Foundation

import RxSwift
import RxCocoa
import RxFlow

class SettingFlow: Flow {
    let viewModel: SettingViewModel
    let navigationController: UINavigationController
    var root: RxFlow.Presentable {
        self.navigationController
    }
    
    init(
        navigationController: UINavigationController,
        viewModel: SettingViewModel
    ) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppSteps else {return .none}
        print(step)
        
        switch step {
        case .setting:
            let vc = SettingVC(viewModel: self.viewModel)
            self.navigationController.present(vc, animated: true)
            
            return .none
            
        case .settingComplete(let isAll):
            return .end(forwardToParentFlowWithStep: AppSteps.settingComplete(isAll: isAll))
            
        default :
            return .none
        }
    }
}
