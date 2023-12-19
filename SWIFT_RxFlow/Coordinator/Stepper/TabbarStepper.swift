//
//  TabbarStepper.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/19/23.
//

import UIKit

import RxSwift
import RxCocoa
import RxFlow

class TabbarStepper: Stepper {
    var steps: RxRelay.PublishRelay<RxFlow.Step> = .init()
    var initialStep: Step {
        AppSteps.tabbar
    }
    
    func readyToEmitSteps() {
        print("호출")
    }
}
