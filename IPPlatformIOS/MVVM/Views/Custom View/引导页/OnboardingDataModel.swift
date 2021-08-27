//
//  OnboardingModel.swift
//  Onboarding
//
//  Created by Augustinas Malinauskas on 06/07/2020.
//  Copyright © 2020 Augustinas Malinauskas. All rights reserved.
//

import Foundation

struct OnboardingDataModel {
    var image: String
    var heading: String
    var text: String
}

extension OnboardingDataModel {
    static var data: [OnboardingDataModel] = [
        OnboardingDataModel(image: "1_Onboarding", heading: "宣传页标语1", text: "宣传页标语1内容宣传页标语1内容,宣传页标语1内容宣传页标语1内容,宣传页标语1内容"),
        OnboardingDataModel(image: "2_Onboarding", heading: "宣传页标语2", text: "宣传页标语1内容宣传页标语1内容,宣传页标语1内容宣传页标语1内容,宣传页标语1内容"),
        OnboardingDataModel(image: "3_Onboarding", heading: "宣传页标语3", text: "宣传页标语1内容宣传页标语1内容,宣传页标语1内容宣传页标语1内容,宣传页标语1内容"),
    ]
}
