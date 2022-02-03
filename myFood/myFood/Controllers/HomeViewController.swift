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
    
    let labelAdress: UILabel = {
        let label = UILabel()
        label.text = "Praça Roberto Gomes Pedrosa, 1"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: UIScreen.main.bounds.width <= 375 ? 14 : 16)
        label.textAlignment = .left
        return label
    }()
    
    let editionButton: UIButton = {
      let button = UIButton()
        button.setTitle("Editar", for: .normal)
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: UIScreen.main.bounds.width <= 375 ? 14 : 18, weight: .bold)
        button.setTitleColor(.link, for: .normal)
        button.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 0.255, alpha: 100)
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 8
      return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupNavigation()
        setupView()
        setupContrains()
//        bindUI()
    }
    
    fileprivate func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(labelAdress)
        scrollView.addSubview(editionButton)
    }
    
    fileprivate func setupContrains() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        labelAdress.frame = CGRect(x: UIScreen.main.bounds.width <= 375 ? view.left+10 : view.left+20,
                                   y: UIScreen.main.bounds.width <= 375 ? view.top+5 : view.top+20,
                                   width: view.width+20,
                                   height: 50
        )
        
        editionButton.frame = CGRect(x: UIScreen.main.bounds.width <= 375 ? labelAdress.right-110 : labelAdress.right-180,
                                     y: UIScreen.main.bounds.width <= 375 ? view.top+10 : view.top+20,
                                     width: UIScreen.main.bounds.width <= 375 ? 70 : 100,
                                     height: UIScreen.main.bounds.width <= 375 ? 40 : 50
        )
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
}
