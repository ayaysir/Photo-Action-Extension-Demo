//
//  ContentView.swift
//  Photo Action Extension Demo
//
//  Created by 윤범태 on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    @State var uiImage = UIImage(named: "cyber")
    
    var body: some View {
        VStack {
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            }
            
            Text("Image View and Edit")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
