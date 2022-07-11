//
//  Model.swift
//  combinetask
//
//  Created by 白井裕人 on 2022/07/11.
//

import Foundation
import AVFoundation
import UIKit

struct Model {
    // おみくじデータ
    let data: [[Any]] = [[UIImage(named: "大吉")!, "大吉です。おめでとうございます！\n今年一年いいことがあるかも！？"],
                         [UIImage(named: "吉")!, "吉です。おめでとうございます！\n今月は何か特別な何かが起きるかも！？"],
                         [UIImage(named: "中吉")!, "中吉です。おめでとうございます！\n今週は何かいいことが起きるかも！？"],
                         [UIImage(named: "末吉")!, "末吉です。おめでとうございます！\n今日いいことが起こりますよ！きっとね"],
                         [UIImage(named: "吉")!, "吉です。おめでとうございます！\n今月は何か特別な何かが起きるかも！？"],
                         [UIImage(named: "中吉")!, "中吉です。おめでとうございます！\n今週は何かいいことが起きるかも！？"],
                         [UIImage(named: "末吉")!, "末吉です。おめでとうございます！\n今日いいことが起こりますよ！きっとね"],
                         [UIImage(named: "凶")!, "凶です。\n今日は足元に気をつけて過ごしてください..."]]
    
    
    // ランダムでおみくじを返すfunc
    func getOmikuji() -> (Any, Any) {
        
        let resultValue = Int.random(in: 0...data.count)
        
        print(data.count)
        
        print("resultValue\(resultValue)")
        
        print(data[resultValue][0])
        print(data[resultValue][1])
        
        return (data[resultValue][0], data[resultValue][1])
        
    }
    
}
