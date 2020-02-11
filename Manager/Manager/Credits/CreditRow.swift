//
//  CreditRow.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/06.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct CreditRow: View {
    var credit: Lectureinfo
    
    var body: some View {
        HStack {
            Text(verbatim: credit.name!)
            Spacer()
            
            if credit.isCompleted {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct CreditRow_Previews: PreviewProvider {
    static var previews: some View {
        CreditRow(credit: creditData[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
