#include "backend.hpp"


Backend::Backend(QObject *parent) :
    QObject(parent)
{

}

QString Backend::patientId() const
{
    return m_patientId;
}

void Backend::setPatientId(const QString &newPatientId)
{
    if (m_patientId == newPatientId) return;

    m_patientId = newPatientId;
    emit patientIdChanged();
}

void Backend::setCaptureSession(QMediaCaptureSession *session)
{
    if (!session) {
        qWarning() << "No capture session provided!";
        return;
    }

    m_imageCapture = new QImageCapture();
    session->setImageCapture(m_imageCapture);

    connect(m_imageCapture, &QImageCapture::imageCaptured, this, &Backend::onImageCaptured);

    qDebug() << "Capture session set successfully!";
}

void Backend::captureImage()
{
    if (!m_imageCapture) {
        qWarning() << "Image capture is not available!";
        return;
    }
    m_imageCapture->capture();
}

void Backend::onImageCaptured(int, const QImage &image)
{
//    QString savePath = QDir::currentPath() + "/patient_photos/patient_" +
//                       QDateTime::currentDateTime().toString("yyyyMMdd_hhmmss") + ".png";

//    QDir().mkpath(QDir::currentPath() + "/patient_photos");

    QString imgDirPath = QDir::currentPath() + "/patient_photos";

    if (!QDir(imgDirPath).exists()) {
        QDir().mkpath(imgDirPath);
    }
    QString imgSavePath = imgDirPath + "/patient_" + m_patientId + ".png";

    if (image.save(imgSavePath)) {
        qDebug() << "Image saved at:" << imgSavePath;
    } else {
        qWarning() << "Failed to save image!";
    }
}
