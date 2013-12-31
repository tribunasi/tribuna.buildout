Installation
============

To install simply run ``make``, which will install everything that is needed.

Start the instance up, go to where it is located with a web browser and click
on `Create a new Plone site`, where you need to select the `tribuna.policy`
add-on.

Testing
=======

All tests are included in tribuna.policy. To run them, just run ``make test``
or just ``make``.

Documentation
=============

To build documentation for all modules (buildout, annotator, content,
diazotheme and policy) run ``make docs``. You need to run ``make`` at least
once before you can run ``make docs`` successfully (or you can run ``make
docs`` twice, but it will fail the first time).

Translations
============

To extract translations, move to ``src/tribuna.content/tribuna/content/`` and
run the ``manage_translations.sh`` command that is inside the folder
(``./manage_translations.sh``).

Requirements
============

Plone requirements: http://developer.plone.org/getstarted/requirements.html

Contributing
============

If you want to contribute to any of the repositories, please fork it and then
submit a pull request
