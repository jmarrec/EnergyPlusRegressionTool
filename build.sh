#!/bin/bash -e

BUILD_CONFIG=$1

VERSION_STRING=$(grep VERSION epregressions/__init__.py | cut -d= -f2 | xargs)

rm -rf deploy

case ${BUILD_CONFIG} in

  Ubuntu20)
    python3 setup.py sdist bdist_wheel --dist-dir dist_pypi
    pyinstaller --onefile --add-data "epregressions/diffs/math_diff.config:epregressions/diffs" epregressions/runner.py
    mkdir deploy
    tar -zcvf deploy/EnergyPlusRegressionTool-"${VERSION_STRING}"-Ubuntu20.04.tar.gz -C dist runner
    ;;

  Ubuntu18)
    python3 setup.py sdist bdist_wheel --dist-dir dist_pypi
    pyinstaller --onefile --add-data "epregressions/diffs/math_diff.config:epregressions/diffs" epregressions/runner.py
    mkdir deploy
    tar -zcvf deploy/EnergyPlusRegressionTool-"${VERSION_STRING}"-Ubuntu18.04.tar.gz -C dist runner
    ;;

  Mac)
    python3 setup.py sdist bdist_wheel --dist-dir dist_pypi
    /Users/travis/Library/Python/3.7/bin/pyinstaller --onefile --add-data "epregressions/diffs/math_diff.config:epregressions/diffs" epregressions/runner.py
    mkdir deploy
    tar -zcvf deploy/EnergyPlusRegressionTool-"${VERSION_STRING}"-Mac.tar.gz -C dist runner
    ;;

  Windows)
    python.exe setup.py sdist bdist_wheel --dist-dir dist_pypi
    pyinstaller --onefile --add-data "epregressions/diffs/math_diff.config;epregressions/diffs" epregressions/runner.py
    mkdir deploy
    /C/Program\ Files/7-zip/7z.exe a deploy/EnergyPlusRegressionTool-"${VERSION_STRING}"-Windows.zip ./dist/*
    ;;

  *)
    echo "Unknown config passed to packaging script!"
    ;;

esac
