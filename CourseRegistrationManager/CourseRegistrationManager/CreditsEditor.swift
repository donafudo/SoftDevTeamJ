//
//  CreditsEditor.swift
//  CourseRegistrationManager
//
//  Created by Nakai Keitaro on 2019/11/28.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI

struct CreditsEditor: View {
    var credits: [Credits] = [Credits]()
    //credits[0].name = "ソフトウェア開発演習I"
    var body: some View {
        List {
            Text("CreditsEditor")
            //Text(credits[0].name)
            HStack{
                Text("共通")
                Text("英語")
                Text("2")
            }
            HStack{
                Text("専門基礎")
                Text("微積")
                Text("2")
            }
            HStack{
                Text("専門")
                Text("プログラミング")
                Text("2")
            }
        }
        .navigationBarTitle(Text("CreditsEditor"))
    }
}

struct CreditsEditor_Previews: PreviewProvider {
    static var previews: some View {
        CreditsEditor(credits: [Credits]())
    }
}
