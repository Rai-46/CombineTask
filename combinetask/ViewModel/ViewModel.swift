//
//  ViewModel.swift
//  combinetask
//
//  Created by 白井裕人 on 2022/07/11.
//

import Foundation
import Combine
import UIKit

class ViewModel: ObservableObject {
    @Published var isTapMovie: Bool = false
    
    // Publisher
    private let onEndSubject = PassthroughSubject<Bool, Never>()
    // Subscriber
    private var cancellable = Set<AnyCancellable>()
    
    private let soundPlayer = SoundPlayer()
    
    private var cancellables: [Cancellable] = []
    
    @Published var kikkyo: UIImage = (UIImage(named: "凶"))!
    @Published var message: String = ""
    
    @Published var isShowImage: Bool = false
    
    
    // Model
    private let model = Model()
    
    
    init() {
        onEndSubject
            .sink { _ in
                // ここで音を鳴らす処理をかく
                print(".sinkが呼ばれたよ")
                self.soundPlayer.SEPlay()
            }
        // sinkの戻り値のsubscriptionに対して何もしないで破棄してしまうと、subscribeで指定した受信処理が破棄される。storeメソッドを使うと、subscription を保持できる。これによって、受信処理が保持される。複数のsubscribeを行う場合も、それぞれのsubscriptionをstoreメソッドで保持できます。
            .store(in: &cancellable)
    }
    
    func onTapView() {
        // タップされたよって送る。音を鳴らす
        onEndSubject.send(true)
        // ViewをresultViewに切り替える
        isTapMovie.toggle()
        
    }
    
    // おみくじのデータを取ってくる
    func getResultData() {
        // Anyのタプルで保持
        let data: (Any, Any) = model.getOmikuji()
        // UIImageにダウンキャスト
        kikkyo = data.0 as! UIImage
        // Stringにダウンキャスト
        message = data.1 as! String
    }
    
}


