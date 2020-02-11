//
//  Home.swift
//  CourseRegistrationManager
//
//  Created by Nakai Keitaro on 2019/11/28.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct Home: View {
    var categories: [String: [Lectureinfo]] {
        Dictionary(
            grouping: creditData.sorted(byKeyPath: "id", ascending: true),
            by: { $0.subjectType!.rawValue}
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
    
    var randomLecture: Lectureinfo {
        creditData[Int.random(in: 0 ..< creditData.count)-1]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                CompletedCredits(credits: randomLecture)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: CreditList().environmentObject(Store())) {
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


struct CompletedCredits: View {
    var credits: Lectureinfo
    var body: some View {
        ImageStore.shared.image(name: credits.imageType?.rawValue ?? "study")
    }
}
 
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(UserData())
    }
}
 
