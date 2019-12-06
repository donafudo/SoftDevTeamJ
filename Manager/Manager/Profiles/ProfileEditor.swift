//
//  ProfileEditor.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/05.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Text("名前").bold()
                Divider()
                TextField("名前", text: $profile.username)
            }
            HStack {
                Text("学部").bold()
                Divider()
                TextField("学部", text: $profile.faculty)
            }
            HStack {
                Text("学科").bold()
                Divider()
                TextField("学科", text: $profile.department)
            }
            HStack {
                Text("所属").bold()
                Divider()
                TextField("所属", text: $profile.course)
            }
            /*HStack {
                Text("年次").bold()
                Divider()
                TextField("年次", text: $profile.grade)
                
            }*/
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
