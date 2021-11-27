//
//  CategoryListViewModel.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-11-26.
//

import Foundation
import Combine

class CategoryListViewModel: ObservableObject {
    @Published var categoryRowViewModels = [CategoryRowViewModel]()
    @Published var categoryRepository = CategoryRepository()

    private var cancellables = Set<AnyCancellable>()

    init() {
//        self.taskRowViewModels = dummyTasks.map { item in
//         TaskRowViewModel(task: item)
//        }
        categoryRepository.$categories
            .map {cs in
                cs.map { c in
                    CategoryRowViewModel(category: c)
                }
            }
            .assign(to: \.categoryRowViewModels, on: self)
            .store(in: &cancellables)
    }

    func addCategory(category: Category) {
        categoryRepository.addCtg(category)
    }
    
//    func deleteSession(session: Session) {
//        sessionRepository.deleteSession(session)
//    }
}
