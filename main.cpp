#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <qqmlcontext.h>
#include "musicinfo.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QList<QObject*> dataList;
    dataList.append(new MusicInfo("oatmello - no way back","qrc:/Resource/img/example.png"));
    dataList.append(new MusicInfo("Wildflower","qrc:/Resource/img/sample2.jpg"));
    dataList.append(new MusicInfo("digitalluc - Float","qrc:/Resource/img/sample3.jpg"));
    dataList.append(new MusicInfo("blnkspc_ - Sticky","qrc:/Resource/img/sample4.jpg"));
    dataList.append(new MusicInfo("love the way you are","qrc:/Resource/img/sample5.jpg"));
    dataList.append(new MusicInfo("soft and skin","qrc:/Resource/img/sample6.jpg"));
    dataList.append(new MusicInfo("miss you like crazy","qrc:/Resource/img/sample7.jpg"));


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("myModel",  QVariant::fromValue(dataList));

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
