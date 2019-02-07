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
    dataList.append(new MusicInfo("lo-fi","shiloh"));
    dataList.append(new MusicInfo("lo-fi","shiloh"));
    dataList.append(new MusicInfo("lo-fi","shiloh"));
    dataList.append(new MusicInfo("lo-fi","shiloh"));
    dataList.append(new MusicInfo("lo-fi","shiloh"));
    dataList.append(new MusicInfo("lo-fi","shiloh"));





    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("myModel",  QVariant::fromValue(dataList));

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
