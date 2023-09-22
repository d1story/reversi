//
//  MenuView.swift
//  reversi
//
//  Created by eric liu on 2023-09-17.
//

import SwiftUI

struct MenuView: View {
    @Binding var time:Int
    @Binding var unlimitedtime:Bool
    @Binding var gamestarted:Bool
    var body: some View {
        ZStack{
            Color.green
            ForEach(Array(stride(from: 0, to: 900, by: 100)), id: \.self){i in
                Path() { path in
                    path.move(to: CGPoint(x:0, y:i))
                    path.addLine(to: CGPoint(x:400, y:i))
                }
                .stroke(Color.black, lineWidth: 3.0)
            }
            ForEach(Array(stride(from: 0, to: 393, by: 393/4)), id: \.self){i in
                Path() { path in
                    path.move(to: CGPoint(x:i, y:0))
                    path.addLine(to: CGPoint(x:i, y:900))
                }
                .stroke(Color.black, lineWidth: 3.0)
            }
            Ellipse()
                .frame(width:500, height:200)
                .position(x:200, y:60)
            Circle()
                .frame(width:90)
                .position(x:147.5, y:650)
            Circle()
                .fill(.white)
                .frame(width:90)
                .position(x:245, y:650)
            Circle()
                .frame(width:90)
                .position(x:245, y:750)
            Circle()
                .fill(.white)
                .frame(width:90)
                .position(x:147.5, y:750)
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 350, height: 400)
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 300, height: 80)
                .position(x:192, y:360)
                .foregroundColor(.gray)
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 300, height: 80)
                .position(x:192, y:470)
                .foregroundColor(.gray)
            VStack{
                Text("Reversi")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .position(x:175, y:90)
                    .foregroundColor(Color.white)
                VStack{
                    Text("Time per Move:")
                        .foregroundStyle(.white)
                        .font(.system(size:25, weight:.bold))
                        .position(x:192, y: 30)
                    Stepper(value: $time, in: 10...120, step: 10){
                        Text("\(time) seconds")
                            .foregroundColor(Color.white)
                            .font(.system(size: 25, weight:.bold))
                    }
                    .frame(width: 275)
                    .position(x:192, y:25)
                    Toggle(isOn : $unlimitedtime){
                        Text("Unlimited Time")
                    }
                    .frame(width:250, height: 90)
                    .foregroundColor(.white)
                    .font(.system(size:25, weight:.bold))
                    .position(x:192, y:35)
                    Button("Start Game"){
                        gamestarted = true
                    }
                    .frame(width:300, height: 40)
                    .background(Color.gray)
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                    .font(.system(size:25, weight:.bold))
                    .position(x:192, y:25)
                }
                .frame(width: 380, height: 400)
                .position(x:175)
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

