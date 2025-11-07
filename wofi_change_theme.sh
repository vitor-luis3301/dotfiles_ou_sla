#!/bin/bash

~/theme-scripts/change_theme.sh $(ls themes | sed -e 's:\.[^./]*$::' | wofi --show dmenu)