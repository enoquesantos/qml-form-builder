#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "readjson.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    ReadJson readJson;
    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("ReadJson", &readJson);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
