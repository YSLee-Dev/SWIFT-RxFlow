//
//  SearchViewModel.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/19/23.
//

import Foundation

import RxSwift
import RxCocoa
import RxFlow
import NSObject_Rx

class SearchViewModel: NSObject, Stepper {
    var steps: RxRelay.PublishRelay<RxFlow.Step> = .init()
    var initialStep: Step {
        AppSteps.search
    }
    
    struct Input {
        let homeBtnTap: Observable<Void>
        let detailBtnTap: Observable<Void>
        let homeDetailBtnTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        input.homeBtnTap
            .map { _ in
                AppSteps.home
            }
            .bind(to: steps)
            .disposed(by: rx.disposeBag)
        
        input.detailBtnTap
            .map {
                AppSteps.detail(type: .search)
            }
            .bind(to: steps)
            .disposed(by: rx.disposeBag)
        
        input.homeDetailBtnTap
            .map {
                AppSteps.detail(type: .searchToHome)
            }
            .bind(to: steps)
            .disposed(by: rx.disposeBag)
        
        return Output()
    }
    
    override init() {
    }
}
