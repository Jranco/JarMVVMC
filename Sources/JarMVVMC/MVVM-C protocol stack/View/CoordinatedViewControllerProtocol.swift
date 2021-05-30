//
//  CoordinatedViewControllerProtocol.swift
//  
//
//  Created by Thomas Segkoulis on 03.02.21.
//

import Foundation

public protocol CoordinatedViewControllerProtocol {
    associatedtype ViewModel: CoordinatedViewModelProtocol
    var viewModel: ViewModel? { get set }
}
