#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include "datamodel.h"
#include <QVariant>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQuickView view;

    DataModel *model = new DataModel();

    view.rootContext()->setContextProperty(QString("data_model"), model);

    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view.show();
    return app.exec();
}
