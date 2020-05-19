//
//  ViewController.swift
//  mah445_FinalProject_Starter
//
//  Created by Mohammed Hussien on 5/13/20.
//  Copyright © 2020 Mohammed Hussien. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!

    let reuseIdentifier = "NewsTableViewCellReuse"
    
    var newsArticles = [NewsArticle]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New York Times News Articles"
        view.backgroundColor = .white

        tableView = UITableView()
//        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsArticleTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView() // so there's no empty lines at the bottom
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        
        setupConstraints()
        getClasses()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    @objc func pushNavViewController(news : String, snippet : String, url : String) {
        let vc = DetailViewController(delegate: self as? SaveNewDetailDelegate, titleString: news, snippetString: snippet, urlString: url)
        print("we in boyzzz")
        present(vc, animated: true, completion: nil)
    }

    func getClasses() {
        print("here first")
        NetworkManager.getNewsArticle { (newsArticles) in
            self.newsArticles = newsArticles
            print("here first and")
//            print(newsArticles)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

// MARK: - UITableView Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NewsArticleTableViewCell
        cell.configure(for: newsArticles[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticles.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("touchedd")
        pushNavViewController(news: newsArticles[indexPath[1]].lead_paragraph, snippet: newsArticles[indexPath[1]].snippet, url: newsArticles[indexPath[1]].web_url)
            
        print(newsArticles[indexPath[1]].web_url)
        print(newsArticles[indexPath[1]].snippet)
        print(newsArticles[indexPath[1]].lead_paragraph)
        }
}

