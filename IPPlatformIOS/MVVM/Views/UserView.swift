//
//  UserVIew.swift
//  PlaygroundCollection
//
//  Created by 吕博 on 2021/7/29.
//

import SwiftUI

/// 视图
struct UserView: View {
   
    @StateObject private var viewModel = UserProfileViewModel()

    var body: some View {
        
        VStack {
            List {
                ForEach(viewModel.user) { user in
                    VStack {
                        Text(user.name)
                        Text(user.email)
                        Text(user.body)
                    }
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct UserVIew_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
