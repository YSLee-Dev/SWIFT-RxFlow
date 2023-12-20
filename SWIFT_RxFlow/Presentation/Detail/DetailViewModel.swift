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
        let backBtnTap: Observable<Void>
        let otherVCBtnTap: Observable<Void>
        let settingBtnTap: Observable<Void>
    }
    
    struct Output {
        let title: Driver<String>
        let btnTitle: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        input.backBtnTap
            .map { _ in
                AppSteps.detailComplete(type: .none)
            }
            .bind(to: self.steps)
            .disposed(by: rx.disposeBag)
        
        input.otherVCBtnTap
            .withLatestFrom(Observable.just(self.type))
            .map {
                $0 == .home ? AppSteps.detailComplete(type: .home) : AppSteps.detailComplete(type: .search)
            }
            .bind(to: self.steps)
            .disposed(by: rx.disposeBag)
        
        input.settingBtnTap
            .map { _ in
                AppSteps.setting
            }
            .bind(to: steps)
            .disposed(by: self.rx.disposeBag)
        
        return Output(
            title: Observable.just(self.type.rawValue)
                .asDriver(onErrorDriveWith: .empty()),
            btnTitle: Observable.just(type)
                .map {$0 == .home ? DetailType.search: DetailType.home}
                .map {"\($0)으로 돌아가기"}
                .asDriver(onErrorDriveWith: .empty())
        )
    }
    
    init(type: DetailType) {
        self.type = type
    }
}
