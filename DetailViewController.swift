//  DetialViewController.swift
//  mah445_FinalProject_Starter
//
//  Created by Mohammed Hussien on 5/13/20.
//  Copyright © 2020 Mohammed Hussien. All rights reserved.
//

import UIKit

protocol SaveNewDetailDelegate: class {

    func saveNewDetail(newName: String?)

}
class DetailViewController: UIViewController {

    var textField : UITextView!
    var snippetView : UITextView!
    var urlField : UITextField!
       var searchby : UISearchBar!
    
    weak var delegate: SaveNewDetailDelegate?
    var titleString: String?
    var snippetString : String?
    var urlString : String?
    
    init(delegate: SaveNewDetailDelegate?, titleString: String?, snippetString : String?, urlString : String?) {
        super.init(nibName: nil, bundle: nil)
        
        self.delegate = delegate
        self.titleString = titleString
        self.snippetString = snippetString
        self.urlString = urlString
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = titleString
//        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.isEditable = false
    textField.font = UIFont(name: "d", size: 40)
//        textField.clearsOnBeginEditing = true
        view.addSubview(textField)
        
        snippetView = UITextView()
        snippetView.translatesAutoresizingMaskIntoConstraints = false
        snippetView.text = snippetString
        snippetView.isEditable = false
        snippetView.textAlignment = .center
        view.addSubview(snippetView)
        
        urlField = UITextField()
        urlField.translatesAutoresizingMaskIntoConstraints = false
        urlField.text = urlString
        urlField.textColor = .systemBlue
//        urlField.backgroundColor = .blue
        urlField.textAlignment = .center
        view.addSubview(urlField)
        
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
         NSLayoutConstraint.activate([
         textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
         textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56),
         textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -86),
         textField.heightAnchor.constraint(equalToConstant: 100)
         ])
        
        NSLayoutConstraint.activate([
            snippetView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 60),
        snippetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56),
        snippetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -86),
        snippetView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
        urlField.topAnchor.constraint(equalTo: snippetView.bottomAnchor, constant: 50),
        urlField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56),
        urlField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -86),
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

