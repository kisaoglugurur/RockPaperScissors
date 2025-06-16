//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Gurur on 16.06.2025.
//

import SwiftUI

struct ContentView: View {
    let moves: [String] = ["Rock", "Paper", "Scissors"]
    @State private var result: String = ""
    @State private var wins: Int = 0
    @State private var losses: Int = 0
    @State private var ties: Int = 0
    @State private var resultText: String = ""

    var body: some View {
        VStack(spacing: 96) {
            Text("Rock Paper Scissors")
                .font(.title)
            
            Text(resultText)
            Text(result)
            
            HStack(spacing: 16) {
                ForEach(moves, id: \.self) { move in
                    Button(action: {
                        playGame(move)
                    }) {
                        Text(move.capitalized)
                    }
                    .buttonStyle(.bordered)
                }
            }
            
            HStack {
                Text("Wins: \(wins)")
                Text("Losses: \(losses)")
                Text("Ties: \(ties)")
            }
        }
    }
    
    func playGame(_ playerMove: String) {
        let computerMove = pickComputerMove(from: moves)
        if playerMove == "Rock" {
            if computerMove == "Rock" {
                result = "Tie"
            } else if computerMove == "Paper" {
                result = "Lose"
            } else if computerMove == "Scissors" {
                result = "Win"
            }
        } else if playerMove == "Paper" {
            if computerMove == "Rock" {
                result = "Win"
            } else if computerMove == "Paper" {
                result = "Tie"
            } else if computerMove == "Scissors" {
                result = "Lose"
            }
        } else if playerMove == "Scissors" {
            if computerMove == "Rock" {
                result = "Lose"
            } else if computerMove == "Paper" {
                result = "Win"
            } else if computerMove == "Scissors" {
                result = "Tie"
            }
        }
        
        if result == "Win" {
            wins += 1
        } else if result == "Lose" {
            losses += 1
        } else if result == "Tie" {
            ties += 1
        }
        
        resultText = "👨 \(playerMove) - \(computerMove) 🤖"
    }
    
    func pickComputerMove(from: [String]) -> String {
        return from.randomElement()!
    }
}

#Preview {
    ContentView()
}
