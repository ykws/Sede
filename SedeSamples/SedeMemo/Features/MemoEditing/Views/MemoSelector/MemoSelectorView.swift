//
//  MemoSelectorView.swift
//  SedeMemo
//
//  Created by Ryoichi Izumita on 2021/03/17.
//
//

import SwiftUI
import Sede

enum MemoSelectorMsg {
    case select(UUID)
}

struct MemoSelectorView: View {
    @Seed<[Memo], MemoSelectorMsg> var   seed: [Memo]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        List(seed, id: \.id) { memo in
            Button(action: {
                _seed(.select(memo.id))
                presentationMode.wrappedValue.dismiss()
            },
                   label: { Text(memo.content) })
                .truncationMode(.tail)
        }
    }
}

struct MemoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        MemoSelectorView()
            .environmentObject(
                SeederWrapper<[Memo], MemoSelectorMsg> { [Memo(id: UUID(), content: "Preview")] } receive: { _, _ in })
    }
}
