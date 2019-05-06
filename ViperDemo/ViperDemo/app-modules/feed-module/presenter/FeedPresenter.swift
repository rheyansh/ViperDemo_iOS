//
//  FeedPresenter.swift
//  ViperDemo
//
//  Created by Raj Sharma on 06/05/19.
//  Copyright © 2019 Rheyansh. All rights reserved.
//

import UIKit

class FeedPresenter: ViewToPresenterFeedProtocol {
    
    var interactor: PresenterToInteractorFeedProtocol?
    var view: PresenterToViewFeedProtocol?
    var router: PresenterToRouterFeedProtocol?

    func startFetchingFeed() {
        interactor?.fetchFeed()
    }
}

extension FeedPresenter: InteractorToPresenterFeedProtocol {
    
    func feedFetchSuccess(_ feeds: Array<FeedModal>) {
        view?.onFeedResponseSuccess(feeds)
    }
    
    func feedFetchFailed(_ error: String) {
        view?.onFeedResponseFailed(error)
    }
    
}
