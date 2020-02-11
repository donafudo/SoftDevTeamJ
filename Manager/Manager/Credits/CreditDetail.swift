//
//  CreditDetail.swift
//  Manager
//
//  Created by Nakai Keitaro on 2019/12/06.
//  Copyright © 2019 Nakai Keitaro. All rights reserved.
//

import SwiftUI
import RealmSwift

struct CreditDetail: View {
    @EnvironmentObject private var store: Store
    var credit: Lectureinfo
    
    @State var completed: Bool=false
    
    var creditIndex: Int {
        store.credits.firstIndex(where: { $0.id == self.credit.id})!
    }
    
    init(lecture: Lectureinfo){
        self.credit=lecture
        completed=lecture.isCompleted
    }
    
    var body: some View {
         VStack {
            Spacer()
            CircleImage(image: ImageStore.shared.image(name: credit.imageType?.rawValue ?? "study"))
                .offset(x: 0,y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(verbatim: credit.name!)
                        .font(.largeTitle)
                    
                    Button(action: {
                        let realm = try! Realm()
                        try! realm.write {
                            self.store.credits[self.creditIndex].isCompleted.toggle()
                            self.completed=self.store.credits[self.creditIndex].isCompleted
                        }
                    }) {
                        
                        if self.store.credits[self.creditIndex].isCompleted {
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
                    Text(verbatim: credit.categoryType!.rawValue)
                        .font(.headline)
                        .fontWeight(.regular)
                    Spacer()
                    Text(verbatim: credit.fieldType!.rawValue)
                        .font(.headline)
                        .fontWeight(.regular)
                    Spacer()
                    Text(verbatim: credit.subjectType!.rawValue)
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
        return CreditDetail(lecture: userData.credits[0])
            .environmentObject(Store())
    }
}


class Store: ObservableObject {
    @Published var credits: Results<Lectureinfo> = creditData
    private var notificationTokens: [NotificationToken] = []

    init() {
        // DBに変更があったタイミングでitemEntitiesの変数に値を入れ直す
        notificationTokens.append(credits.observe { change in
            switch change {
            case let .initial(results):
                self.credits = results
            case let .update(results, _, _, _):
                self.credits = results
            case let .error(error):
                print(error.localizedDescription)
            }
        })
    }

    deinit {
        notificationTokens.forEach { $0.invalidate() }
    }
}
