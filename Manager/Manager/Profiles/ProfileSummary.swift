//
//  ProfileSummary.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/05.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    var imageName: String = "icon"
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text(profile.username)
                        .bold()
                        .font(.title)
                    Spacer()
                    NavigationLink(destination: ProfileImage(imageName: self.imageName)) {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                    }
                }
                HStack {
                    Text("学部").bold()
                    Divider()
                    Text(profile.faculty)
                }
                HStack {
                    Text("学科").bold()
                    Divider()
                    Text(profile.department)
                }
                HStack {
                    Text("所属").bold()
                    Divider()
                    Text(profile.course)
                }
                HStack {
                    Text("年次").bold()
                    Divider()
                    Text(String(profile.grade))
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
