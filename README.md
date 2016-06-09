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

## Developmental status

At the moment, MinimalDepInj supports the creation of Matlab objects hierarchies and Matlab containers.Map objects.
