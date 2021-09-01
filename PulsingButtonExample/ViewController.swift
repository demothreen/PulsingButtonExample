//
//  ViewController.swift
//  PulsingButtonExample
//
//  Created by demothreen on 30.08.2021.
//

import UIKit

class ViewController: UIViewController {
  private let pulsingBtn = PulsingButton(color: .red, title: "press \nme")

  override func viewDidLoad() {
    super.viewDidLoad()
    setButton()
  }

  private func setButton() {
    view.addSubview(pulsingBtn)
    pulsingBtn.frame = CGRect(x: view.frame.width/3, y: view.frame.height/3, width: view.frame.width/3, height: view.frame.width/3)
    pulsingBtn.startPulse()
    pulsingBtn.addTarget(self, action: #selector(pressBtn), for: .touchUpInside)
  }

  @objc private func pressBtn() {
    pulsingBtn.stopPulsing()
  }
}
