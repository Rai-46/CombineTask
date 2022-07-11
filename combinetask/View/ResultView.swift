//
//  ResultView.swift
//  combinetask
//
//  Created by 白井裕人 on 2022/07/11.
//

import SwiftUI

struct ResultView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            // 神社のイラスト
            Image("omikugiBG")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            VStack {
                // おみくじのイラスト
                Image(uiImage: viewModel.kikkyo)
                    .offset(x: viewModel.isShowImage ? 0 : -UIScreen.main.bounds.width)
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height / 4)
            }
            
            // メッセージを表示するView
            MessageView(message: viewModel.message)
        }
        .onAppear() {
            viewModel.getResultData()
            withAnimation {
                viewModel.isShowImage.toggle()
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: ViewModel())
    }
}

struct MessageView: View {
    
    var message: String
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                Text(message)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
            }
            .frame(width: UIScreen.main.bounds.width)
            .background(.black.opacity(0.6))
            .foregroundColor(.white)
        }
        
       
    }
}

