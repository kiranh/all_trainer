#include "datamodel.h"
#include <qdir.h>


QString DataModel::getDropBoxHome() const
{
    return dropBoxHome;
}

DataModel::DataModel()
    : QObject()
{
    dropBoxHome = QDir::homePath() + "/Dropbox/for_advait/game";
}

