//
//  ViewController.swift
//  MyFood
//
//  Created by Grazielli Berti on 10/02/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(corder has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        view.backgroundColor = .systemGray5
    }
    
    override func loadView() {
        self.view = HomeView()
    }
    
    fileprivate func setupNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "MyFood App"
                
        UINavigationBar.appearance().isTranslucent = false
        
        let app = UINavigationBarAppearance()
        
        let navigationBar = self.navigationController?.navigationBar
        
        app.backgroundColor = .clear
        app.configureWithOpaqueBackground()
        app.titleTextAttributes = [.foregroundColor: UIColor.systemPink]
        app.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
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
}

