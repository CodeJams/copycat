//
//  ProgressBar.swift
//  Apple Music
//
//  Created by João Paranhos on 24/05/23.
//

import SwiftUI

struct AppleMusicProgressBar: View {
	@Binding var currentTime: TimeInterval
	let duration: Double
	
	var body: some View {
		ZStack(alignment: .leading) {
			Capsule()
				.frame(height: 8)
				.foregroundColor(Color.gray.opacity(0.3))
			
			GeometryReader { geometry in
				Capsule()
					.frame(width: progressBarWidth(geometry: geometry), height: 8)
					.foregroundColor(.green)
					.animation(.linear)
					.gesture(DragGesture(minimumDistance: 0)
						.onChanged({ value in
							updateProgress(value: value.location.x, geometry: geometry)
						})
					)
			}
		}
	}
	
	private func progressBarWidth(geometry: GeometryProxy) -> CGFloat {
		let progress = CGFloat(currentTime / duration)
		return progress * geometry.size.width
	}
	
	private func updateProgress(value: CGFloat, geometry: GeometryProxy) {
		let progress = value / geometry.size.width
		let newTime = TimeInterval(progress) * duration
		currentTime = newTime
	}
}

struct ProgressBar_Previews: PreviewProvider {
	static var previews: some View {
		AppleMusicProgressBar(currentTime: .constant(0), duration: 100)
	}
}
