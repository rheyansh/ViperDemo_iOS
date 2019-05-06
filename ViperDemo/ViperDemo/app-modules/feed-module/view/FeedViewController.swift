//
//  FeedViewController.swift
//  ViperDemo
//
//  Created by Raj Sharma on 06/05/19.
//  Copyright © 2019 Rheyansh. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var uiTableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var feedList = [FeedModal]()
    
    var feedPresenter: ViewToPresenterFeedProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedPresenter?.startFetchingFeed()
        loader.startAnimating()
        
        uiTableView.delegate = self
        uiTableView.dataSource = self
    }

}

extension FeedViewController: PresenterToViewFeedProtocol {
    
    func onFeedResponseSuccess(_ feeds: Array<FeedModal>) {
        loader.stopAnimating()
        feedList = feeds
        uiTableView.reloadData()
    }
    
    func onFeedResponseFailed(_ error: String) {
        
        loader.stopAnimating()
        
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return feedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedCell
        
        let feed = feedList[indexPath.row]
        
        cell.fTitle.text = feed.title
        cell.fDescription.text = feed.body
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
    }
}

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var fTitle: UILabel!
    @IBOutlet weak var fDescription: UILabel!
}
