# MinimalDepInj

## Introduction

MinimalDepInj is a minimalist [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) framework for Matlab.

It is used to create Matlab objects by means of construction plans that reside in Matlab structure types.

## Getting started

### Prerequisites

MinimalDepInj is currently tested only with Matlab Version 2015b. Presumably, it will support other version, too. However, the unit test framework used for testing is only supported in the more recent versions.

### Install

1. Clone the repository or download the zip-archive and extract it at your preferred location.
2. Add the directory *MinimalDepInj/src/* to your Matlab path.
3. Change to *MinimalDepInj/test/*, type `runtests`, and verify that all tests pass.

## Usage

Have a look at *MinimalDepInj/example/exampleScript.m*. The example shows the structure of a configuration struct and how it is used to create objects.

The structure contract of classes, to allow them being constructed by MinimalDepInj, is described in the class *MinimalDepInj/example/Worker.m*.

### Recomandation

Use MinimalDepInj together with [JSONlab](http://iso2mesh.sourceforge.net/cgi-bin/index.cgi?jsonlab). You can then create configuration templates for object building as simple text files in the *.json*-format. This allows you to examine configuration templates at a glance or to easily edit files in order to change object properties.

A *.json* configuration file might look as follows:

```
{
	"method": "Worker",
	"workBehavior": {
		"method": "Singing",
		"songTitle": "Greensleeves"
	}
}
```

## Developmental status

At the moment, MinimalDepInj supports the creation of:
- Matlab object hierarchies (*depInj.createObjFromTree.m*),
- Matlab object matrices, which can be imbedded within object hierarchies (*depInj.createObjMatrix.m*),
- variables loaded from *.mat files* (*depInj.loadSingleVarFromFile.m*), and
- Matlab containers.Map objects (*depInj.createMap.m*).
