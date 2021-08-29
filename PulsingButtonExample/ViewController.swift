//
//  ViewController.swift
//  PulsingButtonExample
//
//  Created by demothreen on 30.08.2021.
//

import UIKit

class ViewController: UIViewController {
  private var centerView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private var insideLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 24)
    label.textColor = .white
    label.text = "press \nme"
    label.textAlignment = .center
    label.numberOfLines = 2
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    setView()
    setInsideLabel()
  }

  private func setView() {
    view.addSubview(centerView)
    NSLayoutConstraint.activate([
      centerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
      centerView.heightAnchor.constraint(equalTo: centerView.widthAnchor),
      centerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      centerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    centerView.layer.cornerRadius = view.frame.width/6
    centerView.layer.masksToBounds = true
  }

  private func setInsideLabel() {
    centerView.addSubview(insideLabel)
    NSLayoutConstraint.activate([
      insideLabel.centerYAnchor.constraint(equalTo: centerView.centerYAnchor),
      insideLabel.centerXAnchor.constraint(equalTo: centerView.centerXAnchor)
    ])
  }
}

