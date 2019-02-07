#include "musicinfo.h"

MusicInfo::MusicInfo(QObject *parent) : QObject(parent)
{

}

MusicInfo::MusicInfo(const QString &name, const QString &src)
    :m_strName(name),m_strImgSrc(src)
{

}

QString MusicInfo::name()
{
    return m_strName;
}

void MusicInfo::setName(const QString &name)
{
    if(name == m_strName)
        return;
    m_strName = name;
    emit nameChanged();
}

QString MusicInfo::imgSrc()
{
    return m_strImgSrc;
}

void MusicInfo::setImgSrc(const QString &src)
{
    if(src == m_strImgSrc)
        return;
    m_strImgSrc = src;
    emit imgSrcChanged();
}
