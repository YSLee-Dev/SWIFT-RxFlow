//
//  SettingViewModel.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/20/23.
//

import Foundation

import RxSwift
import RxCocoa
import RxFlow
import NSObject_Rx

class SettingViewModel: NSObject, Stepper {
    var steps: PublishRelay<Step> = .init()
    
    var initialStep: Step {
        AppSteps.setting
    }
    
    struct Input {
        let backBtnTap: Observable<Void>
        let popBtnTap: Observable<Void>
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        input.backBtnTap
            .map {
                AppSteps.settingComplete(isAll: false)
            }
            .bind(to: self.steps)
            .disposed(by: rx.disposeBag)
        
        input.popBtnTap
            .map {
                AppSteps.settingComplete(isAll: true)
            }
            .bind(to: self.steps)
            .disposed(by: rx.disposeBag)
        
        return Output()
    }
    
    override init() {
        
    }
}
