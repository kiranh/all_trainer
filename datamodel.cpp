#include "datamodel.h"
#include <qdir.h>
#include <QFile>
#include <QTextStream>


QString DataModel::getDropBoxHome() const
{
    return dropBoxHome;
}

QString DataModel::getDataHome() const
{
    return dataHome;
}

void DataModel::readSettingsFile()
{
    QFile settingFile = QFile(QDir::homePath() + ".srs_trainer");
    if (settingFile.exists()) {
        if (!settingFile.open(QIODevice::ReadOnly |
                              QIODevice::Text))
            return;

        QTextStream in(&file);
        while (!in.atEnd()) {
            QString line = in.readLine();
            dataHome = line;
        }
    }
}

DataModel::DataModel()
    : QObject()
{
    dropBoxHome = QDir::homePath() + "/Dropbox/for_advait/game";
    readSettingsFile();
}

