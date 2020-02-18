# Mbt Creator 

[![Build Travis-CI Status](https://travis-ci.org/ifak/mbtcreator.svg?branch=master)](https://travis-ci.org/ifak/mbtcreator) [![Build status](https://ci.appveyor.com/api/projects/status/f44qnk4y4c5u407a?svg=true)](https://ci.appveyor.com/project/mnrdr/mbtcreator) [![License](https://img.shields.io/badge/license-LGPLv3-blue.svg)](https://github.com/ifak/mobata/blob/master/LICENSE)

**Mbt (Model Based Test) Creator** is a GUI based tool for model based testing including the following features:
- Requirement Formalization 
- Model Synthesis (Seperate, see [full version](https://github.com/ifak/mbtcreator#full-version))
- Model Transformation
- Statemachine Simulation
- Specification Model Editors (Statemachine, Petri Net, Requirements, Test Cases)
- Test Generation (Seperate, see [full version](https://github.com/ifak/mbtcreator#full-version))
- Test Execution (Seperate, see [full version](https://github.com/ifak/mbtcreator#full-version))

## Authors and major contributors
- [ifak] (https://www.ifak.eu)
Institut für Automation und Kommunikation - Mbt Creator  project lead
- [...]

## Prerequisites
- [Qt](https://www.qt.io/) (Qt LTS 5.12 recommended)

## Contributing to Mbt Creator 
Please follow these steps to contribute to mbtcreator:
1. Fork the ifak/mbtcreator repo
2. Build mbtcreator using latest Qt LTS (Currently 5.12 - https://www.qt.io/)
3. Run the mbtcreator unit tests (see **Running Unit Tests** below)
4. Create a pull request including your change

## Running Unit Tests
All Unit Tests in mbtcreator are implemented using [Qt Test framework](https://doc.qt.io/qt-5/qttest-index.html).
It is recommended to run all units tests using the QtCreator, an IDE developed by Qt:
- [Running Tests in QtCreator](https://doc.qt.io/qtcreator/creator-autotest.html#building-and-running-tests)

Alternatively, it is possible to run the tests by starting the executable generated for each test script or by running *nmake check* in the build directory using a console.

## Full version
Some features of the Mbt Creator are not included in the open source release but are available to interested parties. To learn more, contact (martin.reider@ifak.eu)

## License
Mbt Creator is open source software licensed under the [LGPLv3](https://github.com/ifak/mbtcreator/blob/master/LICENSE).



