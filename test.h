#ifndef TEST_H
#define TEST_H

#include <QObject>
#include <QDebug>
#include <QVariant>
#include <QTimer>

class Test : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int workload READ valued WRITE setValued NOTIFY progress)

public:
    explicit Test(QObject *parent = nullptr); 

    int valued();
    void setValued(int data);

signals:
    void progress();
    void start();
    void stop();
    void pause();
    void resume();

private slots:
    void timedout();

public slots:
    void started();
    void stopped();
    void paused();
    void resumed();

private:
    QTimer m_timer;
    int m_value;
};

#endif // TEST_H
