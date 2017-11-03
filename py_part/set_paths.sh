#!/bin/bash
. ../env/bin/activate
export PYTHONPATH="$(pwd)/socn"
export DJANGO_SETTINGS_MODULE="$(basename $PYTHONPATH/socn)".abs_settings
