//
//  NewStudvc.swift
//  StudentManagementSystemCoreData
//
//  Created by DCS on 20/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NewStudvc: UIViewController {
    
    
    var students : Student?
    
    
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
    
    
    @objc private func savestud()
    {
        let name = nametxt.text!
        let id = spidtxt.text!
        let password = passwordtxt.text!
        let std = stdtxt.text!
        let age = Int(agetxt.text!)!
        let phone = phonetxt.text!
        
        
       // let stud  = Student(id : id, name : name,password: password,std : std,age:age,phone:phone)
        
        if let stud = students
        {
            
            CoreDataHandler.shared.update(stud: stud, id: id, name: name, pwd: password, phone: phone, std: std, age: age)
            {
                [weak self] in
                
                self?.navigationController?.popViewController(animated: true)
                
            }
            
        }
        else{
            CoreDataHandler.shared.insert(id: id, name: name, pwd: password, phone : phone, std: std, age: age)
            {
                [weak self] in
                self?.navigationController?.popViewController(animated: true)
                
            }
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(spidtxt)
        view.addSubview(agetxt)
        view.addSubview(passwordtxt)
        view.addSubview(nametxt)
        view.addSubview(phonetxt)
        view.addSubview(stdtxt)
        view.addSubview(mybtn)
        view.backgroundColor = .black
        
        //update
        
        if let stud = students
        {
            
            spidtxt.text = stud.spid
            spidtxt.isEnabled = false
            nametxt.text = stud.studName
            passwordtxt.text = stud.password
            phonetxt.text = stud.phoneno
            stdtxt.text = stud.standard
            agetxt.text = String(stud.age)
            
            
            
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       spidtxt.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 20, width: view.width - 80, height: 40)
        nametxt.frame = CGRect(x: 40, y: spidtxt.bottom + 10, width: view.width - 80, height: 40)
        agetxt.frame = CGRect(x: 40, y: nametxt.bottom + 10, width: view.width - 80, height: 40)
        stdtxt.frame = CGRect(x: 40, y: agetxt.bottom + 10, width: view.width - 80, height: 40)
        phonetxt.frame = CGRect(x: 40, y: stdtxt.bottom + 10, width: view.width - 80, height: 40)
        passwordtxt.frame = CGRect(x: 40, y: phonetxt.bottom + 10, width: view.width - 80, height: 40)
        mybtn.frame = CGRect(x: 40, y: passwordtxt.bottom + 10, width: view.width - 80, height: 40)
    }

}

