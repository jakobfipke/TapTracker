//
//  TaskRow.swift
//  FirePhone
//
//  Created by Medhat Elmasry on 2021-10-20.
//

import SwiftUI

struct CategoryRow: View {
    @ObservedObject var ctgRVM: CategoryRowViewModel
    
    var onCommit: (Category) -> (Void) = { _ in }
    
    var body: some View {
        
        TextField("Enter category name", text: $ctgRVM.category.CategoryTitle, onCommit:{ self.onCommit(self.ctgRVM.category)
        })
        
        
    }
}

//struct CategoryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryRow(categoryRowViewModel: CategoryRowViewModel(category: Category(CategoryTitle: "Category", Count: <#T##Int#>)))
//    }
//}
