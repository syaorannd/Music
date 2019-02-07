#ifndef MUSICINFO_H
#define MUSICINFO_H

#include <QObject>

class MusicInfo : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString imgSrc READ imgSrc WRITE setImgSrc NOTIFY imgSrcChanged)
public:
    explicit MusicInfo(QObject *parent = nullptr);
    MusicInfo(const QString &name, const QString &src);
    QString name();
    void setName(const QString &name);
    QString imgSrc();
    void setImgSrc(const QString &src);

signals:
    void nameChanged();
    void imgSrcChanged();
private:
    QString m_strName;
    QString m_strImgSrc;

public slots:
};

#endif // MUSICINFO_H
