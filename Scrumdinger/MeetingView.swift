//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Frederick Fermin on 4/11/25.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @State private var scrumTimer: ScrumTimer?
    private let player = AVPlayer.dingPlayer()
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                if let timer = scrumTimer {
                    MeetingHeaderView(
                        secondsElapsed: timer.secondsElapsed,
                        secondsRemaining: timer.secondsRemaining,
                        theme: scrum.theme
                    )
                    
                    Circle()
                        .strokeBorder(lineWidth: 24)
                    
                    MeetingFooterView(
                        speakers: timer.speakers,
                        skipAction: timer.skipSpeaker
                    )
                } else {
                    ProgressView("Starting...")
                }
            }
            
            
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            startScrum()
        }
        .onDisappear {
            endScrum()
        }
    }
    
    private func startScrum(){
        Task { @MainActor in
            if scrumTimer == nil {
                scrumTimer = ScrumTimer()
            }
            scrumTimer?.reset(
                lengthInMinutes: scrum.lengthInMinutes,
                attendeeNames: scrum.attendees.map(\.name)
            )
            scrumTimer?.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            scrumTimer?.startScrum()
        }
        
    }
    
    private func endScrum(){
        Task { @MainActor in
            scrumTimer?.stopScrum()
            let newHistory = History(attendees: scrum.attendees)
            scrum.history.insert(newHistory, at: 0)
        }
    }

}


#Preview {
    @State var scrum = DailyScrum.sampleData[0]
    return(
        MeetingView(scrum: $scrum))
}
