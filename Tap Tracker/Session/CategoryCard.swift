//
//  CategoryCard.swift
//  Tap Tracker
//
//  Created by Dohun Kim on 2021-10-09.
//

import SwiftUI

struct CategoryCard: View {
    @State var categories: Array<Category>
    var body: some View {
        VStack {
            List {
                ForEach(categories, id: \.CategoryTitle, content: {
                    category in
                    HStack {
                        Text(category.CategoryTitle)
                        Spacer()
                        // TODO: PRINT COUNT FOR EACH CATEGORY HERE
                        Text(String(category.Count))
                    }
                    
                })
            }
        }
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(categories: CateArrRestaurant)
    }
}
