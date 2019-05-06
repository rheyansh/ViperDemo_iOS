//
//  FeedRouter.swift
//  ViperDemo
//
//  Created by Raj Sharma on 06/05/19.
//  Copyright © 2019 Rheyansh. All rights reserved.
//

import UIKit

class FeedRouter: PresenterToRouterFeedProtocol {
    
    static func createFeedModule() -> FeedViewController {
        
        let view = FeedRouter.mainstoryboard.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
        
        var presenter: ViewToPresenterFeedProtocol & InteractorToPresenterFeedProtocol = FeedPresenter()
        var interactor: PresenterToInteractorFeedProtocol = FeedInteractor()
        let router:PresenterToRouterFeedProtocol = FeedRouter()

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.feedPresenter = presenter

        return view

    }
    
    func pushToFeedListScreen(navigationConroller navigationController: UINavigationController) {
        
        let feedModule = FeedRouter.createFeedModule()
        navigationController.pushViewController(feedModule, animated: true)
        
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
