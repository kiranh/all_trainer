#include "audiorecorder.h"
#include <QUrl>

AudioRecorder::AudioRecorder(QObject *parent) : QObject(parent)
{
    b_recording = false;
    q_audioRecorder = QAudioRecorder(this);
    b_fileName = QString("/tmp/recording.wav");
    q_audioRecorder->setOutputLocation(QUrl(b_fileName));
}

void AudioRecorder::record()
{
    if(q_audioRecorder->state() == QMediaRecorder::StoppedState) {
        q_audioRecorder->record();
        b_recording = true;
        emit recordingChanged();
    }
}

void AudioRecorder::stop()
{
    if(q_audioRecorder->state() == QMediaRecorder::RecordingState) {
        q_audioRecorder->stop();
        b_recording = false;
        emit recordingChanged();
    }
}

