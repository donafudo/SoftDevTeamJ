//
//  CategoryRow.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/17.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Credit]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { credit in
                        NavigationLink(
                            destination: CreditDetail(
                                credit: credit
                            )
                        ) {
                            CategoryItem(credit: credit)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var credit: Credit
    var body: some View {
        VStack(alignment: .leading) {
            credit.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(credit.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: creditData[0].category,
            items: Array(creditData.prefix(4))
        )
        .environmentObject(UserData())
    }
}
