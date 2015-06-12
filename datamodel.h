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
private:
    QString dropBoxHome;
};

#endif // DATAMODEL_H
