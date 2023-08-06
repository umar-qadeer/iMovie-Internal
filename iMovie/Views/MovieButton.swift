//
//  MovieButton.swift
//  iMovie
//
//  Created by Muhammad Umar on 06/08/2023.
//

import SwiftUI

struct MovieButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.heartPurple)
            .cornerRadius(10)
    }
}

struct MovieButton_Previews: PreviewProvider {
    static var previews: some View {
        MovieButton(title: "Test Title")
    }
}
