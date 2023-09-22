//
//  GameBoardView.swift
//  reversi
//
//  Created by eric liu on 2023-09-17.
//



import SwiftUI

struct GameBoardView: View {
    @State private var board: [[String]] = Array(repeating: Array(repeating: "", count: 8), count: 8)
    

    let brownTheme: [Color] =
        [Color(UIColor(red: 0xcb / 255.0, green: 0xa4 / 255.0, blue: 0x70 / 255.0, alpha: 1.0)),
         Color(UIColor(red: 0xe4 / 255.0, green: 0xc8 / 255.0, blue: 0xa9 / 255.0, alpha: 1.0)),
         Color(UIColor(red: 0x83 / 255.0, green: 0x5f / 255.0, blue: 0x2e / 255.0, alpha: 1.0))]
    
    let greenTheme: [Color] =
        [Color(red: 0xA9 / 255.0, green: 0xE1 / 255.0, blue: 0xB9 / 255.0),
         Color(red: 0x76 / 255.0, green: 0xC3 / 255.0, blue: 0x8C / 255.0),
         Color(red: 0x4C / 255.0, green: 0x9E / 255.0, blue: 0x81 / 255.0)]

    
    let grayTheme: [Color] =
        [Color(red: 248/255.0, green: 249/255.0, blue: 253/255.0),
         Color(red: 248/255.0, green: 249/255.0, blue: 253/255.0),
         Color.black]
    
    let whiteTheme: [Color] =
        [Color.white, Color.white, Color.black]
    
    
    @State private var selectedTheme: [Color]
    @State var count: Int = 0;
    
    init() {
        _selectedTheme = State(initialValue: brownTheme)
    }
    
    var body: some View {
    VStack{
        VStack (spacing: 0) {
            ForEach(0..<8, id: \.self) { row in
                HStack (spacing: 0) {
                    ForEach(0..<8, id: \.self) { column in
                        ZStack {
                            Rectangle()
                                .frame(width: 39.8, height: 39.8)
                                .foregroundColor((row + column).isMultiple(of: 2) ? selectedTheme[0]:selectedTheme[1])
                                .border(Color.black, width: 0.2)
                            if board[row][column] == "B" {
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                                    .shadow(color: .black, radius: 1, x: 0, y: 1)
                            } else if board[row][column] == "W" {
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 2, x: 0, y: 1)
                            }
                        }
                        .onTapGesture {
                            placePiece(row: row, column: column)
                        }
                    }
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 0.5)
            .stroke(selectedTheme[2], lineWidth: 10))
        .padding()
        
        Picker("Select Theme", selection: $selectedTheme) {
            Text("Brown").tag(brownTheme)
            Text("Green").tag(greenTheme)
            Text("Grey").tag(grayTheme)
            Text("White").tag(whiteTheme)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}
    
    func placePiece(row: Int, column: Int) {
        if board[row][column] == "" {
            board[row][column] = count % 2 == 0 ? "B" : "W"
        }
        count += 1;
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView()
    }
}
