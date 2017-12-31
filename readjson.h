#ifndef READJSON_H
#define READJSON_H

#include <QByteArray>
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QObject>
#include <QVariant>

class ReadJson : public QObject
{
    Q_OBJECT
public:
    ReadJson(QObject *parent = nullptr) : QObject(parent) { }

    Q_INVOKABLE
    QVariant readFile(const QString &fileName) {
        QFile file(fileName);
        QJsonParseError error;
        if (!file.exists() || !file.open(QIODevice::ReadOnly | QIODevice::Text))
            return QVariant();
        QByteArray fileContent(file.readAll());
        file.close();
        QJsonDocument jsonDocument = QJsonDocument::fromJson(fileContent, &error);
        if (error.error == QJsonParseError::NoError && !jsonDocument.isEmpty()) {
            if (jsonDocument.isArray())
                return jsonDocument.array().toVariantList();
            else if (jsonDocument.isObject())
                return jsonDocument.object().toVariantMap();
        }
        return fileContent;
    }
};

#endif // READJSON_H
