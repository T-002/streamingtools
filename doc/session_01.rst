Session 01 - Project Setup
==========================
As an initial step, I want to setup the project to:

* Make use of CircleCI to drive test driven development
* Add Sphinx for documentation purposes
* Using Docker for a simpler accessibility and portability of all
  required tools

CircleCI
--------
CircleCI is a continious integration environment which can be integrated
into Github pretty straight forward.
The configuration can be found in `.circleci/config.yml`.
At the moment, CircleCI basically starts a Python container running the
included unit tests with pytest.

Sphinx
------
As Sphinx is still the default tool when it comes to Python project
documentation, I will use it here as well.
Everything mandatory is configured in `conf.py`.

Docker
------
Docker provides a container environment that can be used to execute the provided
tools in an isolated environment.
This makes it easier to test and deploy them on multiple machines, as all
requirements are already part of the provided container.