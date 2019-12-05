//
//  Home.swift
//  CourseRegistrationManager
//
//  Created by Nakai Keitaro on 2019/11/28.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                CreditsEditor(credits: [Credits]())
                NavigationLink(destination: CreditsEditor(credits: [Credits]())) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Home"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
