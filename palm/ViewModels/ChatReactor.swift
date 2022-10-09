//
//  ChatReactor.swift
//  palm
//
//  Created by orca on 2022/10/05.
//

import Foundation
import ReactorKit

class ChatReactor: Reactor {
    enum Action {
        case back
    }
    
    enum Mutation {
        case back
    }
    
    struct State {
        var chattings: [ChatSection]
    }
    
    var initialState: State
    
    init() {
        let chatting = ChatSection(header: "", items: [
            Chat(id: 1, chat: "chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 chatting 1 "),
            Chat(id: 2, chat: "chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 chatting 2 "),
            Chat(id: 3, chat: "chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 chatting 3 "),
            Chat(id: 4, chat: "chatting 4 chatting 4 chatting 4 chatting 4 chatting 4 chatting 4 chatting 4 chatting 4 chatting 4 "),
            Chat(id: 5, chat: "chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 chatting 5 "),
            Chat(id: 6, chat: "chatting 6 chatting 6"),
            Chat(id: 7, chat: "chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 chatting 7 ")
        ])
        
        initialState = State(chattings: [chatting])
    }
}
