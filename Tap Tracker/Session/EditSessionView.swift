//
//  NewSessionView.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-11-26.
//

import SwiftUI
import GoogleSignIn

enum NotifyMeAboutType: String {
    case directMessages
    case mentions
    case anything
}

enum ProfileImageSize: String {
    case large
    case medium
    case small
}

struct EditSessionView: View {
    //    @State var notifyMeAbout: NotifyMeAboutType = .directMessages
    //    @State var profileImageSize: ProfileImageSize = .medium
    //    @State var playNotificationSounds: Bool = false
    //    @State var sendReadReceipts: Bool = false
    @State var name: String = ""
    @State var description: String = ""
    @State var location: String = ""
    @State var categories: [Category] = []
    @State var showNewItem: Bool = false
    @ObservedObject var categoryListViewModel = CategoryListViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Session Info")) {
                    TextField("Session Name", text: $name)
                        .padding(.leading, 4)
                    ZStack {
                        if description.isEmpty {
                            Text("Description")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.gray.opacity(0.5))
                                .padding(.leading, 4)
                            
                        }
                        TextEditor(text: $description)
                    }
                    TextField("Location", text: $location)
                        .padding(.leading, 4)
                }
                Section(header: Text("Categories")) {
                    List {
                        ForEach (categoryListViewModel.categoryRowViewModels) { rvm in
                            CategoryRow(ctgRVM: rvm)
                        }
                        if showNewItem {
                            CategoryRow(ctgRVM: CategoryRowViewModel(category: Category(CategoryTitle: "", Count: 0))) { ctg in
                                self.categoryListViewModel.addCategory(category: ctg)
                                self.showNewItem.toggle()
                            }
                        }
                        
                    }
                    Button(action: {
                        self.showNewItem.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add new category")
                        }
                    })
                        .padding()
                }
            }
            Spacer()
        }
    }
}

//struct NewSessionView_Previews: PreviewProvider {
//    static var previews: some View {
////        NewSessionView()
//    }
//}
