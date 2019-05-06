//
//  FeedInteractor.swift
//  ViperDemo
//
//  Created by Raj Sharma on 06/05/19.
//  Copyright © 2019 Rheyansh. All rights reserved.
//

import UIKit
import ObjectMapper

class FeedInteractor: PresenterToInteractorFeedProtocol {
    
    var presenter: InteractorToPresenterFeedProtocol?

    func fetchFeed() {
        
        getFeeds { (feeds, error) in
            
            DispatchQueue.main.async {
             
                if let feeds = feeds {
                    self.presenter?.feedFetchSuccess(feeds)
                } else {
                    self.presenter?.feedFetchFailed(error ?? "Failed to load data.")
                }
            }
        }
    }
    
    private func getFeeds(_ callBack: ((Array<FeedModal>?, String?) -> ())?) {
        
        ServiceHelper.sharedService.requestAPI(url: WebServiceConstant.feedEndPoint, parameter: nil, httpMethodType: .GET) { (result, error) in

            if let list = result as? Array<Dictionary<String, Any>> {
                let feeds = Mapper<FeedModal>().mapArray(JSONArray: list)
                callBack?(feeds, nil)
            } else {
                callBack?(nil, "Error in fetching feed")
            }
        }
    }
}
