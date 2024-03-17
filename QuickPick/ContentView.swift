//
//  ContentView.swift
//  QuickPick
//
//  Created by Ahsan Qureshi on 3/16/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var choice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var result = ""
    @State private var showResult = false
    @State private var score = 0
    
    private let moves = ["🪨", "📄", "✂️"]
    private let win = ["📄", "✂️", "🪨"]
    private let lose = ["✂️", "🪨", "📄"]
    private let colors: [Color] = [.black, .white, .gray]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Score: \(score)")
                    .font(.title)
                    .padding()
            }
            Spacer()
            Text("Play a move to...")
            Text(shouldWin ? "WIN" : "LOSE")
                .bold()
                .foregroundStyle(shouldWin ? .green : .red)
                .font(.extraLargeTitle)
            Text("against")
            Text(moves[choice])
                .bold()
                .font(.system(size: 100))
                .padding()
            HStack {
                ForEach(0..<3) { moveIndex in
                    Button(moves[moveIndex]) {
                        playMove(moveIndex)
                    }
                    .font(.system(size: 100))
                    .padding()
                    .buttonStyle(.borderless)
                }
            }
            Spacer()
        }
        .alert(result, isPresented: $showResult) {
            Button("Continue") {
                playAgain()
            }
        }
    }
    
    func playMove(_ index: Int) {
        var compareArray: [String]
        if (shouldWin) {
            compareArray = win
        } else {
            compareArray = lose
        }
        
        if (moves[index] == compareArray[choice]) {
            result = "Correct!"
            score += 1
        } else {
            result = "Wrong!"
        }
        showResult = true
    }
    
    func playAgain() {
        choice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
