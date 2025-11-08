#ifndef BACKEND_HPP
#define BACKEND_HPP

#include <QObject>
#include <QtMultimedia/QImageCapture>
#include <QtMultimedia/QMediaCaptureSession>
#include <QDebug>
#include <QStandardPaths>
#include <QDir>
#include <QDateTime>
#include <QString>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString patientId READ patientId WRITE setPatientId NOTIFY patientIdChanged FINAL)

public:
    explicit Backend(QObject *parent = nullptr);

    QString patientId() const;
    void setPatientId(const QString &newPatientId);

    Q_INVOKABLE void captureImage();
    Q_INVOKABLE void setCaptureSession(QMediaCaptureSession *session);

signals:
    void patientIdChanged();

private slots:
    void onImageCaptured(int id, const QImage &image);

private:
    QString m_patientId;
    QImageCapture *m_imageCapture = nullptr;
};

#endif // BACKEND_HPP
