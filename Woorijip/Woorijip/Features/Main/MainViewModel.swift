//
//  MainViewModel.swift
//  Woorijip
//
//  Created by 김준호 on 2023/06/02.
//

import Combine
import Foundation

final class MainViewModel: BaseViewModel {

    private let mainDataSource = MainDataSource()

    func onAppear() {
        addCancellable(
            mainDataSource.meetings(
                categories: "BOOK",
                weekType: "WEEKEND",
                name: "rlaqjawls"
            )
        ) { [weak self] _ in
        }
    }

}
