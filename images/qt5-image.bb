SUMMARY = "A Qt5 development image"
HOMEPAGE = "http://www.jumpnowtek.com"

require console-image.bb

QT_DEV_TOOLS = " \
    qtbase-dev \
    qtbase-mkspecs \
    qtbase-plugins \
    qtbase-tools \
    qtserialport-dev \
    qtserialport-mkspecs \
"

QT_TOOLS = " \
    qtbase \
    qtbase-plugins \
    qtserialport \
    qt5-env \
"

IMAGE_INSTALL += " \
    ${QT_DEV_TOOLS} \
    ${QT_TOOLS} \
"

export IMAGE_BASENAME = "qt5-image"
