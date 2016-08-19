#ifndef DATAMODEL_H
#define DATAMODEL_H

#include <QString>
#include <QObject>
#include <QFile>

class DataModel : public QObject
{
    Q_OBJECT
public:
    DataModel();
    Q_INVOKABLE QString getDropBoxHome() const;
    Q_INVOKABLE QString getDataHome() const;
    Q_INVOKABLE QString setDataHome(QString pDataHome);
private:
    QString dropBoxHome;
    QString dataHome;
    QFile *settingFile;
    void readSettingsFile();
};

#endif // DATAMODEL_H
