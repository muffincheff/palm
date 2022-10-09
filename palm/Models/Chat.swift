//
//  Chat.swift
//  palm
//
//  Created by orca on 2022/10/05.
//

import Foundation
import RxDataSources

struct Chat: ChatType {
    var id: Int
    var chat: String
}

struct ChatSection {
    var header: String
    var items: [Chat]
}

extension ChatSection: SectionModelType {
    init(original: ChatSection, items: [Chat]) {
        self = original
        self.items = items
    }
}
