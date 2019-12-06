//
//  CreditList.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/06.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct CreditList: View {
    @EnvironmentObject private var userData: UserData
       
    var body: some View {
        List {
            Toggle(isOn: $userData.showCompletedOnly) {
                Text("Show Completed Only")
            }
            
            ForEach(userData.credits) { credit in
                if !self.userData.showCompletedOnly || credit.isCompleted {
                    NavigationLink(
                        destination: CreditDetail(credit: credit)
                            .environmentObject(self.userData)
                    ) {
                        CreditRow(credit: credit)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Credits"))
    }
}

struct CreditsList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreditList()
        }
        .environmentObject(UserData())
    }
}
