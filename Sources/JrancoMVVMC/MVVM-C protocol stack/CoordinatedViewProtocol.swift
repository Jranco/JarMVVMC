//
//  CoordinatedViewProtocol.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 29/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

public protocol CoordinatedViewProtocol {
    associatedtype ViewModel: CoordinatedViewModelProtocol
    var viewModel: ViewModel? { get set }
}
