Helptbx Toolbox

Purpose
=======

This module allows to update the help of a module, based
on a set of .sci files.
It is a tool built on top of the help_from_sci function.

Dependencies
------------

 * This module depends on the Assert module.
 * This module depends on the Apifun module (v>=0.2).

Features
========

The main function is :

helptbx_helpupdate ( funarray , helpdir , macrosdir )
helptbx_helpupdate ( funarray , helpdir , macrosdir , demosdir , modulename )
helptbx_helpupdate ( funarray , helpdir , macrosdir , demosdir , modulename , verbose )

which automatically updates the .xml help pages of a module if required,
and updates the Demo gateway if required.

Authors
=======

 * Copyright (C) 2012 - Michael Baudin
 * Copyright (C) 2010 - 2011 - DIGITEO - Michael Baudin

Forge
-----

http://forge.scilab.org/index.php/p/helptbx/

ATOMS
-----

http://atoms.scilab.org/toolboxes/helptbx

TODO
====

 * Allow to skip the generation of the demos.

Licence
-------

This toolbox must be used under the terms of the CeCILL.

