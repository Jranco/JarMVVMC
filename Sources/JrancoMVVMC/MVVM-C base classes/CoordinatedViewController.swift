//
//  CoordinatedViewController.swift
//  AufmassGenerator
//
//  Created by Thomas Segkoulis on 08.11.20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import UIKit

class CoordinatedViewController<ViewModel: CoordinatedViewModelProtocol>: UIViewController, CoordinatedViewProtocol {

    // MARK: - Private properties
    
    private var isModallyPresented: Bool = false
    
    // MARK: - ViewModel
    
    var viewModel: ViewModel?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModallyPresented = self.presentingViewController != nil
        self.configureSubviews()
        self.viewModel?.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel?.willAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel?.didAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.viewModel?.willDisappear()
        
        if self.isMovingFromParent {
            self.viewModel?.willBeRemovedFromParent()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if isModallyPresented {
            self.viewModel?.modalViewDismissed()
        }
    }
    
    func configureSubviews() {
    }
}
