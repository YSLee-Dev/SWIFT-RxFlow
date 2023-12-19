//
//  DetailViewModel.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/19/23.
//

import Foundation

import RxSwift
import RxCocoa
import RxFlow
import NSObject_Rx

class DetailViewModel: NSObject, Stepper {
    let type: DetailType
    
    var steps: RxRelay.PublishRelay<RxFlow.Step> = .init()
    
    var initialStep: Step {
        AppSteps.detail(type: type)
    }
    
    struct Input {
        let backBtn: Observable<Void>
    }
    
    struct Output {
        let title: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        input.backBtn
            .map { _ in
                AppSteps.detailComplete
            }
            .bind(to: steps)
            .disposed(by: rx.disposeBag)
        
        return Output(
            title: Observable.just(self.type.rawValue)
                .asDriver(onErrorDriveWith: .empty())
        )
    }
    
    init(type: DetailType) {
        self.type = type
    }
}
