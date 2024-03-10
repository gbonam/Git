#include "test.h"

Test::Test(QObject *parent)
    : QObject{parent}
{
    m_timer.setInterval(1000);
    connect(&m_timer, QTimer::timeout, this, Test::timedout);
}

void Test::timedout()
{
    //qInfo() << "timeout" << m_value;
    m_value++;
    emit progress();
    if (m_value > 99) stopped();
}

int Test::valued()
{
    //qInfo() << "Valued" << m_value;
    return m_value;
}

void Test::setValued(int data)
{
    qInfo() << "Setting value" << data;
    m_value = data;
    emit progress();
}

void Test::started()
{
    setValued(0);
    m_timer.start();
    qInfo() << "Started";
    emit start();
}

void Test::stopped()
{
    //setValued(0);
    m_timer.stop();
    qInfo() << "Stopped";
    emit stop();
}

void Test::paused()
{
    m_timer.stop();
    qInfo() << "Paused";
    emit pause();
}

void Test::resumed()
{
    m_timer.start();
    qInfo() << "Resumed";
    emit resume();
}
