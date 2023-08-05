//
//  LoadingCell.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

struct LoadingCell: View {
    var body: some View {
        VStack {
            ProgressView()
        }
    }
}

struct LoadingCell_Previews: PreviewProvider {
    static var previews: some View {
        LoadingCell()
    }
}
