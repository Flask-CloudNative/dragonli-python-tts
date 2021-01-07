import os
from azure.cognitiveservices.speech import AudioDataStream, SpeechConfig, SpeechSynthesizer
from azure.cognitiveservices.speech.audio import AudioOutputConfig
from azure.cognitiveservices.speech.languageconfig import AutoDetectSourceLanguageConfig


class ToSpeech():
    def __init__(self):
        self.speech_key = os.environ.get('SPEECH_KEY', None)
        self.service_region = os.environ.get('SERVICE_REGION', None)
        self.speech_config = SpeechConfig(
            subscription=self.speech_key,
            region=self.service_region,
        )

    def recognize(self, text):
        synthesizer = SpeechSynthesizer(
            speech_config=self.speech_config,
            audio_config=None,
            auto_detect_source_language_config=AutoDetectSourceLanguageConfig()
        )
        result = synthesizer.speak_text_async(text).get()
        stream = AudioDataStream(result)
        return stream
