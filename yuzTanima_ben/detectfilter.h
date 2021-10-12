#ifndef DETECTFILTER_H
#define DETECTFILTER_H


#include <QAbstractVideoFilter>
#include <QDebug>
#include <QTemporaryFile>
#include <QMutex>
#include "opencv2/opencv.hpp"

class detectfilter : public QAbstractVideoFilter
{
     Q_OBJECT
public:
       QVideoFilterRunnable *createFilterRunnable();
signals:
    void objectDetected(float x, float y, float w, float h);

public slots:

};

#endif // DETECTFILTER_H
