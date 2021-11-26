//
//  SessionRowViewModel.swift
//  Tap Tracker
//
//  Created by Jakob Fipke on 2021-10-29.
//

import Foundation
import Combine

class SessionRowViewModel: ObservableObject, Identifiable {
    @Published var session: Session
    @Published var sessionRepo = SessionRepository()

    var id = ""
    @Published var completionStateIconName = ""

    private var cancellables = Set<AnyCancellable>()

    init(session: Session) {
        self.session = session

        $session
            .compactMap { session in
                session.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
        $session
            .dropFirst() // drop first update and only send subsequent updates
            .debounce(for: 1, scheduler: RunLoop.main) // make sure that not every keystroke causes update. This waits .8 seconds between updates
            .sink { session in
                self.sessionRepo.updateSession(session)
            }
            .store(in: &cancellables)

    }
}

