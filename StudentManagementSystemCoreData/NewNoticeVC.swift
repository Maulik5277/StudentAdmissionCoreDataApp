//
//  NewNoticeVC.swift
//  StudentAdmissionSystemUsingSqlite
//
//  Created by DCS on 20/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NewNoticeVC: UIViewController {

    
    var notes : Note?
    
    private let spidtxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter userid"
        txt.textColor = .black
        txt.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        //txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        txt.layer.borderWidth = 5
        txt.layer.cornerRadius = 10
        return txt
    }()
    
    private let nametxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter name"
        txt.textColor = .black
        txt.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        //txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        txt.layer.borderWidth = 5
        txt.layer.cornerRadius = 10
        return txt
    }()
    private let agetxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter age"
        txt.textColor = .black
        txt.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        //txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        txt.layer.borderWidth = 5
        txt.layer.cornerRadius = 10
        return txt
    }()
    private let passwordtxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter password"
        txt.textColor = .black
        txt.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        // txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        txt.layer.borderWidth = 5
        txt.layer.cornerRadius = 10
        return txt
    }()
    
    private let phonetxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter phone No"
        txt.textColor = .black
        txt.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        // txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        txt.layer.borderWidth = 5
        txt.layer.cornerRadius = 10
        return txt
    }()
    
    private let stdtxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter class"
        txt.textColor = .black
        txt.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        //  txt.borderStyle = .roundedRect
        txt.font = UIFont(name : "", size : 20.0)
        txt.textAlignment = .center
        txt.layer.borderWidth = 5
        txt.layer.cornerRadius = 10
        return txt
    }()
    
    
    private let mybtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        btn.addTarget(self, action: #selector(savestud), for: .touchUpInside)
        // btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 5
        return btn
    }()
    
    
    @objc private func saveNote()
    {
        let name = txttitle.text!
       
        let cont = contentView.text!
        
      //  let notice = Note(nid: 0, ntitle: name, msg: cont)
        if let notice = notes
        {
            
            CoreDataHandler.shared.nupdate(note: notice, title: name, msg : cont)
            {
                [weak self]  in
               
                    self?.navigationController?.popViewController(animated: false)
            }
                
        }
        else{
            CoreDataHandler.shared.ninsert(title: name, msg: cont)
            {
                
                  [weak self] in
                self?.navigationController?.popViewController(animated: false)
                
            }
        }
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        view.addSubview(mybtn)
        view.addSubview(txttitle)
        view.addSubview(contentView)
        
        if let notice = notes
        {
            
            txttitle.text = notice.title
           
            contentView.text = notice.msg
            
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        txttitle.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        contentView.frame = CGRect(x: 40, y: txttitle.bottom + 20, width: view.width - 80, height: 400)
        mybtn.frame = CGRect (x: 40, y: contentView.bottom + 20, width: view.width - 80, height: 40)
    }


}
