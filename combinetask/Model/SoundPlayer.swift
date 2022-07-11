//
//  SoundPlayer.swift
//  combinetask
//
//  Created by 白井裕人 on 2022/07/11.
//

import UIKit

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    // 音声ファイルの読み込み
    let SEData = NSDataAsset(name: "SE")!.data
    
    // 音声プレイヤーの変数(音源ファイルを再生できるようにする)
    var SEPlayer: AVAudioPlayer!
    
    func SEPlay() {
        do {
            SEPlayer = try AVAudioPlayer(data: SEData)
            SEPlayer.play()
        } catch {
            print("SEの音源再生でエラーが発生しました。")
        }
    }
    
}
