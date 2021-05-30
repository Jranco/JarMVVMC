//
//  DataAccessProtocol.swift
//  
//
//  Created by Thomas Segkoulis on 30.05.21.
//

import Foundation

public protocol DataAccessProtocol {
    
    associatedtype DataType
    associatedtype ErrorType: Error
    
    typealias DataAccessCompletion = (_ result: Result<DataType, ErrorType>) -> Void
    
    var data: DataType? { get }
    var shouldLoadMoreData: Bool { get }
        
    func loadData(didFinish completionBlock: @escaping DataAccessCompletion)
    func cancelLoadingDataIfNeeded()
    func cleanupData()
}

public extension DataAccessProtocol {
    
    func loadMoreDataIfNeeded(didFinish completionBlock: @escaping DataAccessCompletion) {
        guard shouldLoadMoreData else { return }
        loadData(didFinish: completionBlock)
    }
    
    func reloadData(didFinish completionBlock: @escaping DataAccessCompletion) {
        cleanupData()
        loadData(didFinish: completionBlock)
    }
}
