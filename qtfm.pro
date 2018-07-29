TEMPLATE = subdirs
CONFIG -= ordered
SUBDIRS += libfm libdisks fm
fm.depends += libfm

CONFIG(basic) {
    CONFIG += no_udisks no_tray
}
!CONFIG(no_udisks) {
    fm.depends += libdisks
}
!CONFIG(no_tray) {
    SUBDIRS += tray
    tray.depends += libdisks libfm
}

lessThan(QT_MAJOR_VERSION, 5): warning("Qt4 is deprecated, please consider upgrading to Qt5 if possible.")
