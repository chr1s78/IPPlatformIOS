//
//  OnboardingStepView.swift
//  Onboarding
//
//  Created by Augustinas Malinauskas on 06/07/2020.
//  Copyright © 2020 Augustinas Malinauskas. All rights reserved.
//

import SwiftUI

struct OnboardingStepView: View {
    var data: OnboardingDataModel
    
    var body: some View {
        VStack(spacing: 2.0) {
            Image(data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 290, height: 290, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top, 125)
            
            VStack(alignment: .leading) {
                Text(data.heading)
                    .foregroundColor(.white)
                    .bold()
                    .font(.title)
                    .padding(.bottom, 10)
                    
                Text(data.text)
                    .foregroundColor(.white.opacity(0.6))
                    .fontWeight(.light)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
           // .frame(width: 288)
            .padding(.top, 45)
            .padding(.horizontal,31)
            .offset(x: -25)
            
           
            Spacer()
        }
        .padding()
       // .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    static var data = OnboardingDataModel.data[0]
    static var previews: some View {
        OnboardingStepView(data: data)
    }
}
