#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include "datamodel.h"
#include <QVariant>
#include <QtQml>
#include "audiorecorder.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<AudioRecorder>("com.codemancers.components", 1, 0, "AudioRecorder");

    QQuickView view;

    DataModel *model = new DataModel();

    view.rootContext()->setContextProperty(QString("data_model"), model);

    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view.show();
    return app.exec();
}
