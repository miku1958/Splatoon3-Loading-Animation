//
//  Splatoon3LoadingView.swift
//  Splatoon3 Gear Manager
//
//  Created by 庄黛淳华 on 2022/10/12.
//

import Extension
import SwiftUI

public struct Splatoon3LoadingView: View {
	// https://www.spriters-resource.com/nintendo_switch/splatoon3/sheet/182952/
	// swiftlint:disable accessibility_label_for_image
	let bigPicture = Image("Nintendo Switch - Splatoon 3 - Loading Animation")
	let size: CGFloat = 130
	let countPerLine = 8

	// https://splatoonwiki.org/wiki/Template_talk:Ink
	static let inkColors: [Color] = [
		Color(hex: 0xfe447d),
		Color(hex: 0xfe447d),
		Color(hex: 0xf78f2e),
		Color(hex: 0xfedc0c),
		Color(hex: 0xd1f20a),
		Color(hex: 0x5cd05b),
		Color(hex: 0x03c1cd),
		Color(hex: 0x9208e7),
		Color(hex: 0xf84c00),
		Color(hex: 0xf3f354),
		Color(hex: 0xbff1e5),
		Color(hex: 0x3bc335),
		Color(hex: 0x7af5ca),
		Color(hex: 0x448bff),
		Color(hex: 0xd645c8),
		Color(hex: 0x0afe15),
		Color(hex: 0x0acdfe),
		Color(hex: 0xff9600),
		Color(hex: 0xb21ca1)
	]

	static let colorChangeFrames: [Int] = [
		4,
		12,
		20,
		28,
		34,
		45,
		52,
		61
	]

	@State var frame = 0
	@State var currentInkColor: Color = Self.inkColors.randomElement()!

	let displayLink = Displaylink(timeInterval: .milliseconds(60))

	public init() { }

    public var body: some View {
		GeometryReader { _ in
			let offsetX: CGFloat = -size * CGFloat(frame % countPerLine)
			let offsetY: CGFloat = -size * CGFloat(frame / countPerLine)
			bigPicture
				.renderingMode(.template)
				.colorMultiply(currentInkColor)
				.offset(x: offsetX, y: offsetY)
		}
		.frame(width: size, height: size)
		.clipped()
		.accessibilityLabel(Text("Loading"))
		.onAppear {
			displayLink.setAction { [self] in
				frame += 1
				if frame >= countPerLine * countPerLine {
					frame = 0
				}
				if Self.colorChangeFrames.contains(frame) {
					var color: Color? = currentInkColor
					while color == currentInkColor {
						color = Self.inkColors.randomElement()
					}
					currentInkColor = color!
				}
			}
		}
    }
}

struct Splatoon3LoadingView_Previews: PreviewProvider {
    static var previews: some View {
		VStack {
			Splatoon3LoadingView()
			ForEach(Splatoon3LoadingView.inkColors, id: \.self) {
				$0.frame(height: 50)
			}
		}
    }
}
