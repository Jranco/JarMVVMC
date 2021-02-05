//
//  CoordinatedViewController.swift
//  AufmassGenerator
//
//  Created by Thomas Segkoulis on 08.11.20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import UIKit

open class CoordinatedViewController<ViewModel: CoordinatedViewModelProtocol>: UIViewController, CoordinatedViewControllerProtocol {

    // MARK: - Private properties
    
    private var isModallyPresented: Bool = false
    
    // MARK: - ViewModel
    
    public var viewModel: ViewModel?
    
    // MARK: - LifeCycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.isModallyPresented = self.presentingViewController != nil
        self.configureSubviews()
        self.viewModel?.didLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel?.willAppear()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel?.didAppear()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.viewModel?.willDisappear()
        
        if self.isMovingFromParent {
            self.viewModel?.willBeRemovedFromParent()
        }
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if isModallyPresented {
            self.viewModel?.modalViewDismissed()
        }
    }
    
    open func configureSubviews() {
    }
}
