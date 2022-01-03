//
//  MyView.swift
//  RxswiftDemo
//
//  Created by huangkunpeng on 2022/1/3.
//

import Foundation
import UIKit
import SnapKit

class MyView : UIView {
    
 
    
    fileprivate lazy var lbTitle1: UILabel = {
        let lbTitle1 = UILabel()
        lbTitle1.text = "lbTitle1 lbTitle1 lbTitle1 lbTitle1lbTitle1 lbTitle1lbTitle1 lbTitle1lbTitle1 lbTitle1lbTitle1 lbTitle1"
        lbTitle1.numberOfLines = 0
        return lbTitle1
    }()
    
    fileprivate lazy var lbTitle2: UILabel = {
        let lbTitle2 = UILabel()
        lbTitle2.text = "lbTitle2 lbTitle2"
        lbTitle2.numberOfLines = 0
        return lbTitle2
    }()
    
    fileprivate lazy var lbTitle3: UILabel = {
        let lbTitle3 = UILabel()
        lbTitle3.text = "lbTitle3 lbTitle3"
        lbTitle3.numberOfLines = 0
        return lbTitle3
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setupUI()
        _layoutUI()
        _bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func _setupUI(){
        
        addSubview(lbTitle1)
        addSubview(lbTitle2)
        addSubview(lbTitle3)
    }
    
    fileprivate func _layoutUI(){
        
        lbTitle1.snp_makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(lbTitle2.snp.left).offset(-5)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        lbTitle2.snp_makeConstraints { make in
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
    
    fileprivate func _bind(){
        
    }
}


