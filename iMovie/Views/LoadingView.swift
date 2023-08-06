//
//  LoadingView.swift
//  iMovie
//
//  Created by Muhammad Umar on 06/08/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2.0)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
