//
//  PersonalEditor.swift
//  CourseRegistrationManager
//
//  Created by Nakai Keitaro on 2019/11/28.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct PersonalEditor: View {
    var personal: Personal
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                NavigationLink(destination: PersonalEditor(personal: Personal())) {
                    EditButton()
                }
            }
            List {
                HStack {
                    Text("学部: ")
                    Text(personal.faculty)
                }
                HStack {
                    Text("学科: ")
                    Text(personal.department)
                }
                HStack {
                    Text("コース: ")
                    Text(personal.course)
                }
                HStack {
                    Text("年次: ")
                    Text(String(personal.grade))
                }
            }
        }
    }
}

struct PersonalEditor_Previews: PreviewProvider {
    static var previews: some View {
        PersonalEditor(personal: Personal())
        
    }
}
