import Foundation
import RealmSwift
import SwiftUI

struct Count: View {
    @State var count : Float = 0
    @EnvironmentObject private var store : Store
    
    func totalAll(filter : String) -> String {
    self.count=0
        for completed in store.credits.filter(filter) {
        self.count += completed.credit
    }
    return count.description
  }
   
  var body: some View {
    VStack{
        HStack{
            Spacer()
            Text("履修済み単位数合計: ")
            Text(count.description).onAppear{
                self.totalAll(filter: "isCompleted=true")
            }
        }
        HStack{
            Spacer()
            Text("健康運動系科目: ")
            Text(count.description+"/2.0").onAppear{
                self.totalAll(filter: "isCompleted=true AND subject='健康'")
            }
        }
    }
  }
}

struct Count_Previews: PreviewProvider {
 static var previews: some View {
  NavigationView {
    Count().environmentObject(Store())
  }
 }
}
