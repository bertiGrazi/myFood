//
//  PromoList.swift
//  MyFood
//
//  Created by Grazielli Berti on 11/02/22.
//

import Foundation
import UIKit

class PromoListView: UIView {
    //MARK: - Variable
    let promoListCell = PromoListCell()
    
    //MARK: - View
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let promosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .firstBaseline
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        setupView()
        configureConstrains()
        updatePromoList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 200)
    }
    
    fileprivate func updatePromoList() {
        for _ in 0..<3 {
            promosStackView.addArrangedSubview(PromoListCell())
        }
    }
    
    fileprivate func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(promosStackView)
    }
    
    fileprivate func configureConstrains() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            promosStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            promosStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            promosStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            promosStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
}
