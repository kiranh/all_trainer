#include "datamodel.h"
#include <qdir.h>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QFileInfo>
#include <QUrl>

QString DataModel::getDropBoxHome() const
{
    return dropBoxHome;
}

QString DataModel::getDataHome() const
{
    return dataHome;
}

QString DataModel::setDataHome(QString pDataHome)
{
    qDebug() << "+ Setting location to " << pDataHome;
    dataHome = QUrl(pDataHome).path();
    QString settingFileLocation = QDir::homePath() + "/.srs_trainer";
    qDebug() << "File location is " << settingFileLocation;

    QFile settingFile(settingFileLocation);

    if (!settingFile.open(QIODevice::WriteOnly |
                          QIODevice::Text)) {
        qDebug() << "Error opening file in text mode";
        qDebug() << settingFile.errorString();
        return QString("");
    }

    QTextStream out(&settingFile);
    out << dataHome << "\n";
    settingFile.close();
    return pDataHome;
}

void DataModel::readSettingsFile()
{
    QFile settingFile(QDir::homePath() + "/.srs_trainer");
    if (settingFile.exists()) {
        if (!settingFile.open(QIODevice::ReadOnly |
                              QIODevice::Text))
            return;

        QTextStream in(&settingFile);
        while (!in.atEnd()) {
            QString line = in.readLine();
            if(!line.isEmpty())
                dataHome = line;
        }
        settingFile.close();
    }
}

DataModel::DataModel()
    : QObject()
{
    dropBoxHome = QDir::homePath() + "/Dropbox/for_advait/game";
    readSettingsFile();
}

