//
//  NextButton.swift
//  Affirmations
//
//  Created by Ruslan Alekyan on 03.08.2024.
//

import SwiftUI

struct NextButton: View {
    var isInvalid = true
    let action: () -> Void
    
    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Text("Continue")
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(.accent)
                .clipShape(.rect(cornerRadius: 15))
        }
        .disabled(isInvalid)
        .opacity(isInvalid ? 0.5 : 1)
    }
}

#Preview {
    NextButton(isInvalid: false, action: {})
}
