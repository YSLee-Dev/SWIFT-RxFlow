//
//  AppSteps.swift
//  SWIFT_RxFlow
//
//  Created by 이윤수 on 12/18/23.
//

import Foundation

import RxFlow

enum AppSteps: Step {
    case tabbar
    case home
    case search
    case detail(title: String)
}
