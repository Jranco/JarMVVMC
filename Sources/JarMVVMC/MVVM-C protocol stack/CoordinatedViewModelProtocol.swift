//
//  CoordinatedViewModelProtocol.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 28/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation

public protocol CoordinatedViewModelProtocol: ViewModelProtocol {
    var coordinatorDelegate: CoordinatorDelegate? { get }
}

extension CoordinatedViewModelProtocol {
    
    /**
     Takes care of additional required cleanup after the view is popped from it's navigation stack.
     */
    func willBeRemovedFromParent() {
        self.coordinatorDelegate?.didFinish()
    }
    
    /**
     Takes care of additional required cleanup after a modally presented view is dismissed.
     */
    func modalViewDismissed() {
        self.coordinatorDelegate?.didFinish()
    }
}
