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
    
    var body: some View {
        List {
            Text(profile.username)
                .bold()
                .font(.title)
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

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
