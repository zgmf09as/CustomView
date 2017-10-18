//
//  CSButton.swift
//  CustomView
//
//  Created by monk773 on 2017. 10. 18..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

public enum CSButtonType {
    case rect
    case circle
}
@IBDesignable
class CSButton: UIButton {

    var style: CSButtonType = .rect {
        didSet {
            switch style {
            case .rect:
                backgroundColor = UIColor.black
                layer.borderColor = UIColor.black.cgColor
                layer.borderWidth = 2
                layer.cornerRadius = 0
                setTitleColor(UIColor.white, for: .normal)
                setTitle("Rect Button", for: .normal)
            case .circle:
                backgroundColor = UIColor.red
                layer.borderColor = UIColor.blue.cgColor
                layer.borderWidth = 2
                layer.cornerRadius = 50
                setTitle("Circle Button", for: .normal)
            }
        }
    }
    
    // 스토리보드에서 호출하는 초기화 함수
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        backgroundColor = UIColor.green
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        setTitle("버튼", for: .normal)
    }
    
    // 프로그래밍 방식으로 객체 생성시 호출하는 초기화 함수
    override init(frame: CGRect) {
        
        // 1단계 초기화
        super.init(frame: frame)
        
        // 2단계 초기화
        backgroundColor = UIColor.gray
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        setTitle("코드로 생성된 버튼", for: .normal)
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    convenience init(type: CSButtonType) {
        self.init()
        
        switch type {
        case .rect:
            backgroundColor = UIColor.black
            layer.borderColor = UIColor.black.cgColor
            layer.borderWidth = 2
            layer.cornerRadius = 0
            setTitleColor(UIColor.white, for: .normal)
            setTitle("Rect Button", for: .normal)
        case .circle:
            backgroundColor = UIColor.red
            layer.borderColor = UIColor.blue.cgColor
            layer.borderWidth = 2
            layer.cornerRadius = 50
            setTitle("Circle Button", for: .normal)
        }
        
        addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
    }
    
    @objc func counting(_ sender: UIButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag) 번째 클릭", for: .normal)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
