//
//  CoordinatorProtocol.swift
//  Asteroidis
//
//  Created by Thomas Segkoulis on 5/10/20.
//  Copyright © 2020 Thomas Segkoulis. All rights reserved.
//

import Foundation
import UIKit

enum CoordinatorNavigationMode {
    case push
    case modal
    case embed
    case custom
}

protocol CoordinatorDelegate: class {
    func didFinish()
    func dismiss()
}

protocol CoordinatorProtocol: CoordinatorDelegate {
    var navigationController: UINavigationController? { get set }
    var coordinators: [String: CoordinatorProtocol] { get set }
    var viewController: UIViewController? { get }
    var navigationMode: CoordinatorNavigationMode? { get set }
    var presenter: CoordinatorProtocol? { get set }
}

extension CoordinatorProtocol {
    
    var name: String {
        return String(describing: self)
    }
    
    func startAsRoot(window: UIWindow) {
        
        guard let viewController = viewController else {
            fatalError("ViewController is missing.")
        }
        
        window.rootViewController = viewController
    }
    
    func start(presenter: CoordinatorProtocol, withNavigationMode navigationMode: CoordinatorNavigationMode) {
        
        guard let viewController = viewController else {
            fatalError("ViewController is missing.")
        }
        
        self.presenter = presenter
        
        self.navigationMode = navigationMode
        
        switch navigationMode {
        case .modal:
            presenter.coordinators[self.name] = self
            presenter.viewController?.present(UINavigationController(rootViewController: viewController), animated: true, completion: nil)
        case .push:
            presenter.coordinators[self.name] = self
            self.navigationController = presenter.navigationController
            presenter.navigationController?.pushViewController(viewController, animated: true)
        case .embed:
            presenter.coordinators[self.name] = self
//            presenter.viewController?.membedViewController(childViewController: viewController, containerView: (presenter.viewController?.view)!)
        default:
            return
        }
    }
    
    func dismiss() {
        
        guard let navigationMode = self.navigationMode, let presenter = self.presenter else {
            fatalError("Navigation mode is set to nil after starting coordinator. No available presenter")
        }
        
        switch navigationMode {
        case .modal:
            self.viewController?.dismiss(animated: true, completion: {
            })
        case .push:
            presenter.navigationController?.popViewController(animated: true)
        default: // TODO: fill embed case
            return
        }
    }
    
    func didFinish() {
        self.presenter?.coordinators[self.name] = nil
        self.navigationMode = nil
    }
}
