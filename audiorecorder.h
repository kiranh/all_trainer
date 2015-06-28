#ifndef AUDIORECORDER_H
#define AUDIORECORDER_H

#include <QObject>
#include <QAudioRecorder>
#include <QString>

class AudioRecorder : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool recording READ recording NOTIFY recordingChanged)
    Q_PROPERTY(QString fileName READ fileName)
public:
    explicit AudioRecorder(QObject *parent = 0);
    const bool &recording() const
    {
        return b_recording;
    }

    const QString &fileName() const {
        return b_fileName;
    }

signals:
    void recordingChanged();

public slots:
    void record();
    void stop();
private:
    bool b_recording;
    QAudioRecorder *q_audioRecorder;
    QString b_fileName;
};

#endif // AUDIORECORDER_H
