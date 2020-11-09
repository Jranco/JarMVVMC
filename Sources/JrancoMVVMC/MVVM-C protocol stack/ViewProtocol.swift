//
//  ViewProtocol.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 5/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

protocol ViewProtocol {
    associatedtype ViewModel: ViewModelProtocol
    var viewModel: ViewModel { get set }
}
