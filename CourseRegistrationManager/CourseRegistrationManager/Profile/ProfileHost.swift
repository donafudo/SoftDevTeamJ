//
//  ProfileHost.swift
//  CourseRegistrationManager
//
//  Created by Nakai Keitaro on 2019/12/05.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode
        
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.mode?.animation().wrappedValue = .inactive
                    }
                    .padding()
                }
                
                Spacer()
                
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                Text("inactive")
            } else {
                Text("else")
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
