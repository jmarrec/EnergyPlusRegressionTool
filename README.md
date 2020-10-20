# EnergyPlus Regressions

[![Documentation Status](https://readthedocs.org/projects/energyplusregressiontool/badge/?version=latest)](https://energyplusregressiontool.readthedocs.io/en/latest/?badge=latest)
[![Build Status](https://travis-ci.org/NREL/EnergyPlusRegressionTool.svg?branch=master)](https://travis-ci.org/NREL/EnergyPlusRegressionTool)
[![Coverage Status](https://coveralls.io/repos/github/NREL/EnergyPlusRegressionTool/badge.svg?branch=master)](https://coveralls.io/github/NREL/EnergyPlusRegressionTool?branch=master)

## Overview

This library provides tools for performing regressions between EnergyPlus builds.
Developers often propose changes to EnergyPlus for:

 - New feature development
 - Defect repair
 - Refactoring for structure or performance

When a developer proposes these changes, those code changes must be tested prior to accepting them into the main branch.
A continuous integration system runs the tests and provides results, but there can be a sometimes lengthy delay waiting on those results, depending on how busy the system is at that time.
This set of tools provides a way to run these regressions locally.

## Usage

This tool works on all three major platforms: Windows, Mac, and Ubuntu LTS (18.04 and 20.04).
Travis runs tests on all the platforms, and it is regularly used on all three as well.

There are two ways to install this tool:
 - Download a pre-built (by Travis) binary package 
   - Downloaded from the Github release [page](https://github.com/NREL/EnergyPlusRegressionTool/releases/latest).
   - The user should not need any extra tools, including Python itself.
   - The downloaded package should be extracted and then the extracted binary should be run directly.
 - Install the library into an existing Python install from [Pypi](https://pypi.org/project/EnergyPlusRegressionTool/1.8.7/) 
   - Download using Pip (`pip install energyplusregressiontool`).
   - Obviously the user will need the existing Python install, but other dependencies are automatically installed by Pip.
   - Once installed into the Python install, there will be a binary available to run: `eplus_regression_runner`. 

## Development

For setting up a development environment to do _work_ on this tool, the steps are pretty minimal:
 - Install Python, if needed
 - Clone this repository (`git clone https://github.com/NREL/EnergyPlusRegressionTool`)
 - Install dependencies (`pip3 install -r requirements.txt`)

## Documentation

Program documentation, including user guide and typical workflows, are available in the documentation.
This documentation is written using RST with Sphinx, and published on [ReadTheDocs](https://energyplusregressiontool.readthedocs.io/en/latest/).

## Testing

Exhaustive unit tests have been added to the "underneath the hood" code, like the functions that calculate diffs and run builds.
The unit tests are run by [Travis](https://travis-ci.org/NREL/EnergyPlusRegressionTool).
The GUI code is not unit tested, but tested routinely on all platforms.
