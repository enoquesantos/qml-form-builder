QT += quick

CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

DISTFILES += \
    sample-form-data-1.json \
    sample-form-data-2.json

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    readjson.h
