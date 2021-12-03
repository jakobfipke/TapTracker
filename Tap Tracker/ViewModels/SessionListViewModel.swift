//
//  SessionListViewModel.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-29.
//

import Foundation
import Combine

class SessionListViewModel: ObservableObject {
    @Published var sessionRowViewModels = [SessionRowViewModel]()
    @Published var sessionRepository = SessionRepository()

    private var cancellables = Set<AnyCancellable>()

    init() {
//        self.taskRowViewModels = dummyTasks.map { item in
//         TaskRowViewModel(task: item)
//        }
        sessionRepository.$sessions
            .map {sessions in
                sessions.map { session in
                    SessionRowViewModel(session: session)
                }
            }
            .assign(to: \.sessionRowViewModels, on: self)
            .store(in: &cancellables)
    }

    func addSession(session: Session) {
        sessionRepository.addSession(session)
    }
    
    func deleteSession(session: Session) {
        sessionRepository.deleteSession(session)
    }

}
