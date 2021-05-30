//
//  ViewControllerLifeCycleProtocol.swift
//  
//
//  Created by Thomas Segkoulis on 29.05.21.
//

import Foundation

public protocol ViewControllerLifeCycleProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
}
