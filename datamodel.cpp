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

void DataModel::setDataHome(QString pDataHome)
{
    dataHome = pDataHome;
    QFile settingFile(QDir::homePath() + ".srs_trainer");

    if (!settingFile.open(QIODevice::WriteOnly |
                          QIODevice::Text))
        return;

    QTextStream out(&settingFile);
    out << pDataHome << "\n";
    settingFile.close();
}

void DataModel::readSettingsFile()
{
    QFile settingFile(QDir::homePath() + ".srs_trainer");
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

