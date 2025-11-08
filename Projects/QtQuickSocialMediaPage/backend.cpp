#include "backend.hpp"

Backend::Backend(QObject *parent)
    : QObject{parent}
{

}

void Backend::openUrlInNewTab(const QUrl &url)
{
    if (QDesktopServices::openUrl(QUrl("about:blank"))) {
        // for some browsers, using "about:blank" as a dummy URL may open a new tab
        QDesktopServices::openUrl(url);
    } else {
        // if the above method doesn't work, try opening in the default way
        QDesktopServices::openUrl(url);
    }
}
