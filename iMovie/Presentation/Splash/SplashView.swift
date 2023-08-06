//
//  SplashView.swift
//  iMovie
//
//  Created by Muhammad Umar on 06/08/2023.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        Image.movieSplash
            .resizable()
            .frame(width: 200, height: 200)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
