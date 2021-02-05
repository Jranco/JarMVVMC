//
//  CoordinatedHostingController.swift
//  
//
//  Created by Thomas Segkoulis on 04.02.21.
//

import UIKit
import SwiftUI

public class CoordinatedHostingController<ContentView: View>: UIHostingController<ContentView>, CoordinatedViewControllerProtocol where ContentView: CoordinatedViewProtocol {
 
    // MARK: - Private properties
    
    var isModallyPresented: Bool = false
    
    // MARK: - ViewModel
    
    public var viewModel: ContentView.ViewModel?
    
    // MARK: - LifeCycle
    
    public override init(rootView: ContentView) {
        super.init(rootView: rootView)
        self.viewModel = rootView.viewModel
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.isModallyPresented = self.presentingViewController != nil
        self.viewModel?.willAppear()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel?.didAppear()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.viewModel?.willDisappear()
        
        if self.isMovingFromParent {
            self.viewModel?.willBeRemovedFromParent()
        }
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if isModallyPresented {
            self.viewModel?.modalViewDismissed()
        }
    }
}
