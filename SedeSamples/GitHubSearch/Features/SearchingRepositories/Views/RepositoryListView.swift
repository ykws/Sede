//
//  RepositoryListView.swift
//  SedeSamples
//
//  Created by Ryoichi Izumita on 2021/03/28.
//
//

import SwiftUI

struct RepositoryListView: View {
    var repositories: [Repository]
    var readMore:     () -> ()

    var body: some View {
        ForEach(repositories.enumerated().map { $0 }, id: \.element.id) { index, repository in
            NavigationLink(repository.name, destination: Text(repository.name))
                .onAppear {
                    guard index == (repositories.count - 1) else { return }
                    readMore()
                }
        }
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView(repositories: [
            Repository(id: 1, name: "Repo", url: URL(string: "https://example.com")!, description: "desc")
        ]) {}
    }
}
