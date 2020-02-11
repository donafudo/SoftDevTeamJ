//
//  CreditList.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/06.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct CreditList: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var store: Store
    
    var body: some View {
        List {
            Count()
            Toggle(isOn: $userData.showCompletedOnly) {
                Text("Show Completed Only")
            }
            
            ForEach(store.credits, id: \.self) { credit in
                ForEachBuilder {
                if !self.userData.showCompletedOnly || credit.isCompleted {
                    NavigationLink(
                        destination: CreditDetail(lecture: credit)
                            .environmentObject(Store())
                    ) {
                        CreditRow(credit: credit)
                    }
                }
                }
            }
        }
        .navigationBarTitle(Text("Credits"))
    }
}

struct ForEachBuilder<Content>: View where Content: View {
    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
    }

}

struct CreditsList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreditList()
        }
        .environmentObject(Store())
        .environmentObject(UserData())
    }
}
