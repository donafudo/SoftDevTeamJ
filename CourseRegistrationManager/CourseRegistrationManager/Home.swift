//
//  Home.swift
//  CourseRegistrationManager
//
//  Created by Nakai Keitaro on 2019/11/28.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: PersonalEditor(personal: Personal())) {
                    Text("Personal")
                }
                NavigationLink(destination: CreditsEditor(credits: [Credits]())) {
                    Text("Credits")
                }
                .navigationBarTitle(Text("CourseRegistrationManager"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
