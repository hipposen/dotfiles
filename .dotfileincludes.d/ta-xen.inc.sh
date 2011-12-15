#!/bin/false

TA_XEN_MINOR="2"
TA_XEN_MAJOR="0"
TA_XEN_CUR_MINOR="2"
TA_XEN_CUR_MAJOR="0"

function taxen {
    ONE=$1
    TWO=$((ONE + 1))
    mv ~/development/ta-xen-additionals_${TA_XEN_CUR_MAJOR}.${TA_XEN_CUR_MINOR}.${1}_1 /home/maik/development/ta-xen-additionals_${TA_XEN_MAJOR}.${TA_XEN_MINOR}.${TWO}_1
}