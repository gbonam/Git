#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QDebug>
#include "test.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Test>("com.company.navblue", 1, 0, "Test");
    const QUrl url(u"qrc:/QMLCppIntegration/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
