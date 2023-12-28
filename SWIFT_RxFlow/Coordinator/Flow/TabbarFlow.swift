//
//  TabbarFlow.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/19/23.
//

import UIKit

import RxSwift
import RxCocoa
import RxFlow

class TabbarFlow: Flow {
    let tabbarController = TabbarController()
    let mainViewModel = MainViewModel()
    
    var root: RxFlow.Presentable {
        self.tabbarController
    }
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppSteps else { return .none }
        
        print(step)
        switch step {
        case .tabbar:
            return self.tabbarCreate()
            
        case .home:
            self.tabbarController.selectedIndex = 0
            return .none
            
        case .search:
            self.tabbarController.selectedIndex = 1
            return .none
            
        case .detail(let type):
            if type == .searchToHome {
                self.tabbarController.selectedIndex = 0
                self.mainViewModel.steps.accept(AppSteps.detail(type: type))
            }
            return .none
            
        default:
            return .none
        }
    }
}

private extension TabbarFlow {
    func tabbarCreate() -> FlowContributors {
        let mainFlow = MainFlow(viewModel: mainViewModel)
        
        let searchViewModel = SearchViewModel()
        let searchFlow = SearchFlow(viewModel: searchViewModel)
        
        Flows.use(mainFlow, searchFlow, when: .created) { main, search in
            let vcs = [main, search]
                .enumerated()
                .map {
                    self.tabbarIconSetting(tag: $0.offset, vc: $0.element)
                }
            
            self.tabbarController.setViewControllers(vcs, animated: true)
        }
        
        return .multiple(flowContributors: [
            .contribute(withNextPresentable: mainFlow, withNextStepper: mainViewModel),
            .contribute(withNextPresentable: searchFlow, withNextStepper: searchViewModel)
        ])
    }
    
    func tabbarIconSetting(tag: Int, vc: UIViewController) -> UIViewController {
        switch tag {
        case 0:
            vc.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: tag)
            return vc
        case 1:
            vc.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: tag)
            return vc
        default:
            return vc
        }
    }
}
