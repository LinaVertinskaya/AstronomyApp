//
//  SelectDateView.swift
//  AstronomyPicture
//
//  Created by Лина Вертинская on 25.12.22.
//

import SwiftUI

struct SelectDateView: View {

    @State private var date = Date()

    @ObservedObject var manager: NetworkManager

    @Environment(\.presentationMode) var presentation

    var body: some View {

        VStack {
            Text("Select a day").font(.headline)

            DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                Text("select")
            }.labelsHidden()

            Button {
                self.manager.date = self.date
                self.presentation.wrappedValue.dismiss()
            } label: {
                Text("Done")
            }
        }
    }
}

struct SelectDateView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDateView(manager: NetworkManager())
    }
}
