//
//  ProfileImage.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/13.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct ProfileImage: View {
    var imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(imageName: "icon")
    }
}
