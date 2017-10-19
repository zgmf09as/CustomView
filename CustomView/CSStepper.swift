//
//  CSStepper.swift
//  CustomView
//
//  Created by monk773 on 2017. 10. 19..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

@IBDesignable
public class CSStepper: UIControl {

    public var leftBtn = UIButton(type: .system)
    public var rightBtn = UIButton(type: .system)
    public var centerLabel = UILabel()
    
    @IBInspectable
    public var value: Int = 0 {
        didSet {
            centerLabel.text = String(value)
            
            // 이 클래스를 사용하는 객체들에게 valueChanged 이벤트 신호 보내기
            sendActions(for: .valueChanged)
        }
    }
    
    @IBInspectable
    public var leftTitle: String = "⬇︎" {
        didSet {
            leftBtn.setTitle(leftTitle, for: .normal)
        }
    }
    
    @IBInspectable
    public var rightTitle: String = "⬆︎" {
        didSet {
            rightBtn.setTitle(rightTitle, for: .normal)
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor = UIColor.blue {
        didSet {
            setBorderColor(color: borderColor)
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 0.5 {
        didSet {
            setBorderWidth(width: borderWidth)
        }
    }
    
    @IBInspectable
    public var centerBackgroundColor: UIColor = UIColor.cyan {
        didSet {
            centerLabel.backgroundColor = centerBackgroundColor
        }
    }
    
    //증감값 단위
    @IBInspectable
    public var stepValue: Int = 1
    
    @IBInspectable
    public var maxValue: Int = Int.max
    
    @IBInspectable
    public var minValue: Int = Int.min
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        //버튼
        leftBtn.tag = -1
        leftBtn.setTitle(leftTitle, for: .normal)
        leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        rightBtn.tag = 1
        rightBtn.setTitle(rightTitle, for: .normal)
        rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        //타이틀
        centerLabel.text = String(value)
        centerLabel.font = UIFont.systemFont(ofSize: 16)
        centerLabel.textAlignment = .center
        centerLabel.backgroundColor = centerBackgroundColor

        setBorderColor(color: borderColor)
        setBorderWidth(width: borderWidth)
       
        addSubview(leftBtn)
        addSubview(rightBtn)
        addSubview(centerLabel)
        
        addEnvent()
    }
    
    private func addEnvent() {
        leftBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        rightBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
    }
    
    private func setBorderColor( color: UIColor ) {
        leftBtn.layer.borderColor = color.cgColor
        rightBtn.layer.borderColor = color.cgColor
        centerLabel.layer.borderColor = color.cgColor
    }
    
    private func setBorderWidth( width: CGFloat ) {
        leftBtn.layer.borderWidth = width
        rightBtn.layer.borderWidth = width
        centerLabel.layer.borderWidth = width
    }

    // 뷰크기 변경시 호출됨
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let btnWidth = self.frame.height
        
        let lblWidth = self.frame.width - (btnWidth * 2)
        
        leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        centerLabel.frame = CGRect(x: btnWidth, y: 0, width: lblWidth, height: btnWidth)
        rightBtn.frame = CGRect(x: btnWidth+lblWidth, y: 0, width: btnWidth, height: btnWidth)
    }
    
    @objc public func valueChange(_ sender: UIButton) {
        let sum = self.value + ( sender.tag * stepValue )
        
        if sum < minValue {
            self.value = minValue
        }
        
        if sum > maxValue {
            self.value = maxValue
        }
        
        self.value = sum
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
