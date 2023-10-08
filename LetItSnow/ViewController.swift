//
//  ViewController.swift
//  breathe
//
//  Created by Tchannikov Daniil on 03/10/2023.
//
import UIKit

class ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .blue
        view.startSnowing()
    }

}
