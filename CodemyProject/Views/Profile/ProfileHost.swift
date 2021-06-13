//
//  ProfileHost.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 07.06.2021.
//

import SwiftUI
import Moya

struct ProfileHost: View {
    @StateObject var viewModel = ViewModel()
    @State var presentingModal = false
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                Button("Edit") { self.presentingModal = true }
                    .sheet(isPresented: $presentingModal) {
                        ProfileEditor(profile: $viewModel.user, presendetAsModal: $presentingModal)
                    }
            }
            ProfileSummary(profile: viewModel.user)
        }
        .padding()
        .onAppear(perform: viewModel.getProfile)
    }
}

extension ProfileHost {
    class ViewModel: ObservableObject {
        @Published var user = User.default
        
        private let userService = MoyaProvider<UserService>()

        func getProfile() {
            userService.request(.getUser(id: 1)) { [weak self] result in
                switch result {
                case let .success(response):
                    let userData = try! JSONDecoder().decode(User.self, from: response.data)
                    self?.user = userData
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost(viewModel: ProfileHost.ViewModel())
    }
}
