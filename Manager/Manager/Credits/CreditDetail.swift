//
//  CreditDetail.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/06.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct CreditDetail: View {
    @EnvironmentObject var userData: UserData
    var credit: Credit
    
    var creditIndex: Int {
        userData.credits.firstIndex(where: { $0.id == credit.id })!
    }
    
    var body: some View {
         VStack {
            Spacer()
            CircleImage(image: credit.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(verbatim: credit.name)
                        .font(.largeTitle)
                    
                    Button(action: {
                        self.userData.credits[self.creditIndex]
                            .isCompleted.toggle()
                    }) {
                        if self.userData.credits[self.creditIndex]
                            .isCompleted {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                    Image(systemName: "trash")
                    Image(systemName: "square.and.arrow.up")
                    Spacer()
                    Text(verbatim: String(credit.credit))
                        .font(.title)
                }
                HStack(alignment: .top) {
                    Text(verbatim: credit.category)
                        .font(.headline)
                        .fontWeight(.regular)
                    Spacer()
                    Text(verbatim: credit.field)
                        .font(.headline)
                        .fontWeight(.regular)
                    Spacer()
                    Text(verbatim: credit.subject)
                        .font(.headline)
                        .fontWeight(.regular)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct CreditDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return CreditDetail(credit: userData.credits[0])
            .environmentObject(userData)
    }
}
