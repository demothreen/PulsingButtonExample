//
//  ViewController.swift
//  PulsingButtonExample
//
//  Created by demothreen on 30.08.2021.
//

import UIKit

class ViewController: UIViewController {
  var pulseLayers = [CAShapeLayer]()
  private var centerBtn: UIButton = {
    let btn = UIButton()
    btn.backgroundColor = .red
    btn.setTitle("press \nme", for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
    btn.titleLabel?.numberOfLines = 2
    btn.titleLabel?.textColor = .white
    btn.titleLabel?.textAlignment = .center
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setView()
  }

  func createPulse() {
    for _ in 0...2 {
      let circularPath = UIBezierPath(arcCenter: .zero, radius: UIScreen.main.bounds.size.width/2.0, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
      let pulseLayer = CAShapeLayer()
      pulseLayer.path = circularPath.cgPath
      pulseLayer.lineWidth = 2.0
      pulseLayer.anchorPoint = CGPoint(x: 50, y: 50)
      pulseLayer.fillColor = UIColor.red.withAlphaComponent(0.3).cgColor
      pulseLayer.lineCap = CAShapeLayerLineCap.round
      pulseLayer.position = CGPoint(x: centerBtn.layer.bounds.midX, y: centerBtn.layer.bounds.midY)
      centerBtn.layer.addSublayer(pulseLayer)
      pulseLayers.append(pulseLayer)
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
      self.animatePulse(index: 0)
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
        self.animatePulse(index: 1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
          self.animatePulse(index: 2)
        }
      }
    }
  }

  func animatePulse(index: Int) {
    pulseLayers[index].strokeColor = UIColor.red.cgColor
    let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
    scaleAnimation.duration = 2.0
    scaleAnimation.fromValue = 0.0
    scaleAnimation.toValue = 0.9
    scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    scaleAnimation.repeatCount = .greatestFiniteMagnitude
    pulseLayers[index].add(scaleAnimation, forKey: "scale")

    let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
    opacityAnimation.duration = 2.0
    opacityAnimation.fromValue = 0.9
    opacityAnimation.toValue = 0.0
    opacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    opacityAnimation.repeatCount = .greatestFiniteMagnitude
    pulseLayers[index].add(opacityAnimation, forKey: "opacity")
  }

  private func setView() {
    view.addSubview(centerBtn)
    centerBtn.frame = CGRect(x: view.frame.width/3, y: view.frame.height/3, width: view.frame.width/3, height: view.frame.width/3)
    centerBtn.layer.cornerRadius = view.frame.width/6
    createPulse()
  }
}

