#ifndef DATAMODEL_H
#define DATAMODEL_H

#include "cpptoml.h"
#include <QString>
#include <QObject>

class DataModel : public QObject
{
    Q_OBJECT
public:
    DataModel();
    Q_INVOKABLE QString getDropBoxHome() const;
    Q_INVOKABLE QString getDataHome() const;
    Q_INVOKABLE void setDataHome(QString pDataHome);
private:
    QString dropBoxHome;
    QString dataHome;
    void readSettingsFile();
};

#endif // DATAMODEL_H
