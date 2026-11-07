import Speech

class SpeechRecog {
    private let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))
    private var request: SFSpeechAudioBufferRecognitionRequest!
    private var task: SFSpeechRecognitionTask?
    
    var onGetText: ((String) -> Void)?
    
    init() {
        SFSpeechRecognizer.requestAuthorization { status in
            print("语音识别权限：\(status.rawValue)")
        }
    }
    
    func start() {
        request = SFSpeechAudioBufferRecognitionRequest()
        request.shouldReportPartialResults = true
        task = recognizer?.recognitionTask(with: request) { [weak self] result, err in
            guard let res = result else { return }
            let text = res.bestTranscription.formattedString
            self?.onGetText?(text)
        }
    }
    
    func feedAudioBuffer(_ buffer: AVAudioPCMBuffer) {
        request?.append(buffer)
    }
    
    func stop() {
        task?.cancel()
        request?.endAudio()
    }
}
