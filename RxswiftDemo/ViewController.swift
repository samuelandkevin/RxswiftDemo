//
//  ViewController.swift
//  RxswiftDemo
//
//  Created by huangkunpeng on 2022/1/3.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        publishSubject()
//        behaviorSubject()
        //        replaySubject()
        
    
        
    }
    
    // MARK: - PublishSubject
    @IBAction func publishSubject(_ sender: Any) {
        //创建一个PublishSubject
        let subject = PublishSubject<String>()
        
        //由于当前没有任何订阅者，所以这条信息不会输出到控制台
        subject.onNext("111")
        
        //第1次订阅subject
        subject.subscribe(onNext: { string in
            print("第1次订阅：", string)
        }, onCompleted:{
            print("第1次订阅：onCompleted")
        }).disposed(by: disposeBag)
        
        //当前有1个订阅，则该信息会输出到控制台
        subject.onNext("222")
        
        //第2次订阅subject
        subject.subscribe(onNext: { string in
            print("第2次订阅：", string)
        }, onCompleted:{
            print("第2次订阅：onCompleted")
        }).disposed(by: disposeBag)
        
        //当前有2个订阅，则该信息会输出到控制台
        subject.onNext("333")
        
        //让subject结束
        subject.onCompleted()
        
        //subject完成后会发出.next事件了。
        subject.onNext("444")
        
        //subject完成后它的所有订阅（包括结束后的订阅），都能收到subject的.completed事件，
        subject.subscribe(onNext: { string in
            print("第3次订阅：", string)
        }, onCompleted:{
            print("第3次订阅：onCompleted")
        }).disposed(by: disposeBag)
    }
    
    
    
    
    // MARK: - BehaviorSubject
    @IBAction func behaviorSubject(_ sender: Any){
        //创建一个BehaviorSubject
        let subject = BehaviorSubject(value: "111")
        
        //第1次订阅subject
        subject.subscribe { event in
            print("第1次订阅：", event)
        }.disposed(by: disposeBag)
        
        //发送next事件
        subject.onNext("222")
        
        
        //第2次订阅subject
        subject.subscribe { event in
            print("第2次订阅：", event)
        }.disposed(by: disposeBag)
        
        subject.onNext("333")
        //发送error事件
        subject.onError(NSError(domain: "local", code: 0, userInfo: nil))
        
        //第3次订阅
        subject.subscribe(onNext: { string in
            print("第3次订阅：", string)
        }, onCompleted:{
            print("第3次订阅：onCompleted")
        }).disposed(by: disposeBag)
        
        subject.onNext("444")
    }
    
    // MARK: - ReplaySubject
    @IBAction func replaySubject(_ sender: Any){
        
        //创建一个bufferSize为2的ReplaySubject
        let subject = ReplaySubject<String>.create(bufferSize: 2)
        
        //连续发送3个next事件
        subject.onNext("111")
        subject.onNext("222")
        subject.onNext("333")
        
        //第1次订阅subject
        subject.subscribe { event in
            print("第1次订阅：", event)
        }.disposed(by: disposeBag)
        
        //再发送1个next事件
        subject.onNext("444")
        
        //第2次订阅subject
        subject.subscribe { event in
            print("第2次订阅：", event)
        }.disposed(by: disposeBag)
        
        //让subject结束
        subject.onCompleted()
        
        //第3次订阅subject
        subject.subscribe { event in
            print("第3次订阅：", event)
        }.disposed(by: disposeBag)
        
        subject.onNext("555")
        
    }
    
   
    
    
}














extension ViewController {
    func testLayout(){
        let button1 = UIButton()
        button1.backgroundColor = .red
        self.view.addSubview(button1)
        button1.snp_makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(100)
            make.top.equalTo(10)
            make.centerX.equalTo(self.view)
        }
        
        let v1 = MyView()
        v1.backgroundColor = .purple
        self.view.addSubview(v1)
        v1.snp_makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(button1.snp.bottom).offset(5)
            make.width.lessThanOrEqualTo(self.view)
        }
        
        let button2 = UIButton()
        button2.backgroundColor = .black
        self.view.addSubview(button2)
        button2.snp_makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.height.equalTo(44)
            make.width.equalTo(100)
            make.top.equalTo(v1.snp.bottom).offset(5)
        }
        
        let v2 = MyView()
        v2.backgroundColor = .orange
        self.view.addSubview(v2)
        v2.snp_makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(button2.snp.bottom).offset(5)
            make.width.lessThanOrEqualTo(self.view)
        }
    }
}
