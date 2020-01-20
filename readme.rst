T-002's streamingtools
======================
Welcome to `streamingtools`.
This library will guide you trough the process on how to develop tools for
streaming services, such as twitch.

If you like to know more, join me on `Twitch`_!

.. toctree::
   :maxdepth: 2

   doc/release_notes.rst
   doc/session_01.rst

Make Targets
------------
To build the package or documentation, please use the provided Docker environment.

The container will contain a ``Makefile`` with the following relevant targets:

* **doc** - Builds the projects documentation into ``dist/doc``.
* **run** - Starts a Docker container.
* **dev** - Starts the Docker container with local file mapping for
            better development and testing.


.. _Twitch: https://www.twitch.tv/pixeldreck
