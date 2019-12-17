//
//  Home.swift
//  CourseRegistrationManager
//
//  Created by Nakai Keitaro on 2019/11/28.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct Home: View {
    var categories: [String: [Credit]] {
        Dictionary(
            grouping: creditData,
            by: { $0.category }
        )
    }
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    
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
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: CreditList()) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Home"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(self.userData)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(UserData())
    }
}
