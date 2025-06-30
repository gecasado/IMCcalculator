//
//  IMCresult.swift
//  cursoSwift
//
//  Created by Gerardo Casado on 30/6/25.
//

import SwiftUI

struct IMCresult: View {
    let userWeight: Double
    let userHeight: Double
    var body: some View {
        VStack {
            Text("tu resultado")
                .font(.title)
                .bold()
                .foregroundColor(.purple)
            let result = calculateIMC(weight: userWeight, height: userHeight)
            informationView(result:result)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundIMC)
    }
}

func calculateIMC(weight: Double, height: Double) -> Double {
    let result = weight/((height / 100) * (height/100))
    return result
}
func clasificationIMC(result: Double) -> (String, Color, String) {
    let title: String
    let color: Color
    let description: String

    switch result {
    case ..<16:
        title = "Delgadez extrema"
        color = .red
        description = "Tu IMC indica una delgadez severa. Es recomendable acudir a un profesional de salud."
    case 16..<17:
        title = "Delgadez moderada"
        color = .orange
        description = "Tienes un peso inferior al recomendado. Una evaluación médica puede ser útil."
    case 17..<18.5:
        title = "Delgadez leve"
        color = .yellow
        description = "Estás ligeramente por debajo del peso normal. Cuida tu alimentación y hábitos."
    case 18.5..<25:
        title = "Peso normal"
        color = .green
        description = "¡Estás en un rango saludable de peso! Mantén tus hábitos."
    case 25..<30:
        title = "Sobrepeso"
        color = .yellow
        description = "Tienes sobrepeso. Considera ajustar tu dieta y realizar actividad física."
    case 30..<35:
        title = "Obesidad tipo I"
        color = .orange
        description = "Esta es una obesidad moderada. Consulta con un especialista para mejorar tu salud."
    case 35..<40:
        title = "Obesidad tipo II"
        color = .red
        description = "Obesidad severa. Es importante un plan de intervención médica y nutricional."
    default:
        title = "Obesidad tipo III"
        color = .purple
        description = "Obesidad mórbida. Es fundamental buscar ayuda médica especializada."
    }

    return (title, color, description)
}

struct informationView: View {
    let result: Double

    var body: some View {
        let information = clasificationIMC(result: result)
        
        VStack {
            Spacer()

            Text(information.0)
                .foregroundColor(information.1)
                .font(.title)
                .bold()

            Spacer()

            Text(String(format: "%.2f", result))
                .font(.system(size: 80))
                .foregroundColor(.white)
                .bold()

            Spacer()

            Text(information.2)
                .foregroundColor(.white)
                .font(.title2)
                .padding(.horizontal, 8)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(16)
        .padding(16)
    }
}

#Preview {
    IMCresult(userWeight: 150, userHeight: 190)
}
