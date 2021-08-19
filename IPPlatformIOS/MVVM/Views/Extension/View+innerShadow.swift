//
//  View+innerShadow.swift
//  IPPlatformIOS
//
//  Created by Chr1s on 2021/8/19.
//

import SwiftUI

import SwiftUI

extension View {
    func innerShadow(color: Color, radius: CGFloat = 0.1) -> some View {
        modifier(InnerShadow(color: color, radius: min(max(0, radius), 1)))
    }
}

private struct InnerShadow: ViewModifier {
    var color: Color = .gray
    var radius: CGFloat = 0.1

    private var colors: [Color] {
        [color.opacity(0.75), color.opacity(0.0), .clear]
    }

    func body(content: Content) -> some View {
        GeometryReader { geo in
            content
                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .top, endPoint: .bottom)
                    .frame(height: self.radius * self.minSide(geo)),
                         alignment: .top)
                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .bottom, endPoint: .top)
                    .frame(height: self.radius * self.minSide(geo)),
                         alignment: .bottom)
                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .leading, endPoint: .trailing)
                    .frame(width: self.radius * self.minSide(geo)),
                         alignment: .leading)
                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .trailing, endPoint: .leading)
                    .frame(width: self.radius * self.minSide(geo)),
                         alignment: .trailing)
        }
    }

    func minSide(_ geo: GeometryProxy) -> CGFloat {
        CGFloat(3) * min(geo.size.width, geo.size.height) / 2
    }
}

struct SVGImage: UIViewControllerRepresentable {
    let controller: Coordinator

    init(name: String) {
        controller = Coordinator(name: name)
    }

    func makeCoordinator() -> Coordinator {
        controller
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<SVGImage>) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<SVGImage>) {
        uiViewController.view = controller.imageView
    }

    func scaledToFill() -> Self {
        controller.contentMode(.scaleAspectFill)
        return self
    }

    func scaledToFit() -> Self {
        controller.contentMode(.scaleAspectFit)
        return self
    }

    func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Self {
        switch renderingMode {
        case .original:
            controller.renderingMode(.alwaysOriginal)
        case .template:
            controller.renderingMode(.alwaysTemplate)
        default:
            controller.renderingMode(.automatic)
        }
        return self
    }

//    func imageColor(_ color: Color) -> Self {
//        imageColor(color.colorInvert())
//    }

    func imageColor(_ color: UIColor) -> Self {
        controller.imageColor(color)
        return self
    }

    class Coordinator {
        let name: String
        let imageView = UIImageView()

        init(name: String) {
            self.name = name
            imageView.image = UIImage(named: name)
        }

        func contentMode(_ mode: UIView.ContentMode) {
            imageView.contentMode = mode
        }

        func renderingMode(_ renderingMode: UIImage.RenderingMode) {
            imageView.image = imageView.image?.withRenderingMode(renderingMode)
        }

        func imageColor(_ color: UIColor) {
            imageView.tintColor = color
            renderingMode(.alwaysTemplate)
        }
    }
}
