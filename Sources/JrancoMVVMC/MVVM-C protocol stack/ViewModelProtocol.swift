//
//  ViewModelProtocol.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 5/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

public protocol ViewModelProtocol {
    associatedtype Model: ModelProtocol
    var model: Model { get set }
    
    func didLoad()
    func willAppear()
    func didAppear()
    func willDisappear()
}
