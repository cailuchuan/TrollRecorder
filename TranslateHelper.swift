import NaturalLanguage

class TranslateHelper {
    static let shared = TranslateHelper()
    private let translator = NLLanguageTranslator()
    
    func translateJapaneseToChinese(jpText: String, completion: @escaping (String?) -> Void) {
        let sourceLang = NLLanguage.japanese
        let targetLang = NLLanguage.simplifiedChinese
        
        translator.translate(jpText, from: sourceLang, to: targetLang) { result in
            switch result {
            case .success(let translatedText):
                completion(translatedText)
            case .failure:
                completion(nil)
            }
        }
    }
}
