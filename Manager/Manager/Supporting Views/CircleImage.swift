//
//  CircleImage.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/17.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: 240, height: 240)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("math"))
    }
}
