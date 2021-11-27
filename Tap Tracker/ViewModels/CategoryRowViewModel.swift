//
//  SessionRowViewModel.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-29.
//

import Foundation
import Combine

class CategoryRowViewModel: ObservableObject, Identifiable {
    @Published var category: Category

    var id = ""
    @Published var completionStateIconName = ""

    private var cancellables = Set<AnyCancellable>()

    init(category: Category) {
        self.category = category

        $category
            .compactMap { category in
                category.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
        $category
            .dropFirst() // drop first update and only send subsequent updates
            .debounce(for: 1, scheduler: RunLoop.main) // make sure that not every keystroke causes update. This waits .8 seconds between updates
            .sink { category in
                
            }
            .store(in: &cancellables)

    }
}

