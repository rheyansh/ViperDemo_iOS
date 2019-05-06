//
//  FeedProtocols.swift
//  ViperDemo
//
//  Created by Raj Sharma on 06/05/19.
//  Copyright © 2019 Rheyansh. All rights reserved.
//

import UIKit

protocol ViewToPresenterFeedProtocol {
    
    var view: PresenterToViewFeedProtocol? {get set}
    var interactor: PresenterToInteractorFeedProtocol? {get set}
    var router: PresenterToRouterFeedProtocol? {get set}

    func startFetchingFeed()
}

protocol PresenterToViewFeedProtocol {
    
    func onFeedResponseSuccess(_ feeds: Array<FeedModal>)
    func onFeedResponseFailed(_ error: String)
}

protocol PresenterToRouterFeedProtocol {
    
    static func createFeedModule() -> FeedViewController
    
    func pushToFeedListScreen(navigationConroller navigationController: UINavigationController)
}

protocol PresenterToInteractorFeedProtocol {
    var presenter: InteractorToPresenterFeedProtocol? {get set}
    func fetchFeed()
}

protocol InteractorToPresenterFeedProtocol {
    
    func feedFetchSuccess(_ feeds: Array<FeedModal>)
    func feedFetchFailed(_ error: String)

}

