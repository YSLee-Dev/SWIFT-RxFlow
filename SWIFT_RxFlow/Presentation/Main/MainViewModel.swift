//
//  MainViewModel.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/18/23.
//

import Foundation

import RxSwift
import RxCocoa
import RxFlow
import NSObject_Rx

class MainViewModel: NSObject, Stepper {
    var steps: RxRelay.PublishRelay<RxFlow.Step> = .init()
    var initialStep: Step {
        AppSteps.home
    }
    
    struct Input {
        let searchBtnTap: Observable<Void>
        let detailBtnTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        input.searchBtnTap
            .map { _ in
                AppSteps.search
            }
            .bind(to: steps)
            .disposed(by: rx.disposeBag)
        
        input.detailBtnTap
            .map {
                AppSteps.detail(type: .home)
            }
            .bind(to: steps)
            .disposed(by: rx.disposeBag)
        
        return Output()
    }
    
    override init() {
       
    }
}
