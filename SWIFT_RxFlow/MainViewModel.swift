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

class MainViewModel: Stepper {
    var steps: RxRelay.PublishRelay<RxFlow.Step> = .init()
    var initialStep: Step {
        AppSteps.home
    }
    
    init() {
      
    }
}
