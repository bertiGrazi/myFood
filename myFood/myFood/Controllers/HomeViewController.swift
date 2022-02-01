//
//  ViewController.swift
//  myFood
//
//  Created by Grazielli Berti on 31/01/22.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - View
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Nome do Restaurante"
        
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupNavigation()
        setupView()
        setupContrains()
    }
    
    fileprivate func setupNavigation() {
        self.navigationItem.title = "MyFood App"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        UINavigationBar.appearance().isTranslucent = false
        
        let app = UINavigationBarAppearance()

        let navigationBar = self.navigationController?.navigationBar

        app.backgroundColor = .clear
        app.configureWithOpaqueBackground()
        app.titleTextAttributes = [.foregroundColor: UIColor.systemPink]
        app.largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]
        app.backgroundColor = .systemGroupedBackground

        self.navigationController?.navigationBar.scrollEdgeAppearance = app

        navigationBar!.standardAppearance = app
        navigationBar!.scrollEdgeAppearance = app
        
        let search = UISearchController(searchResultsController: nil)
        //        search.searchBar.delegate = self
        search.searchResultsUpdater = self as? UISearchResultsUpdating
        search.searchBar.placeholder = "Nome do Restaurante"
        search.searchBar.searchTextField.tintColor = UIColor.gray
        search.searchBar.setImage(UIImage(named: "magnifyingglass")?.withTintColor(UIColor.systemGray), for: .search, state: .normal)
        
        self.navigationItem.searchController = search
    }
    
    fileprivate func setupView() {
        view.addSubview(scrollView)
    }
    
    fileprivate func setupContrains() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
    }
}
