Toadinator - Parametric Musical Instrument Experiment
=====================================================

Toadinator is a web app that enables users with no 3D modeling experience to
create a customized 3D-printable musical instrument.

You can (probably) find a working demo [here](http://toadinator.schmarty.net/).

Motivation
----------

Toadinator was created as part of [Baltimore Education Hack Day](http://educationhackday.org/).

Our group decided to explore the possibilities of 3D printing in the classroom.
Specifically, we wanted to create a customizable musical instrument that could
be used to help students understand the relationships between math and sound.

Want to Contribute?
===================

If you'd like to help develop Toadinator, or simply run your own version,
these instructions might help.

Installation
------------

These instructions assume you are starting with a fresh Ubuntu 11.04 instance.

### Install OpenSCAD

1. Enable multiverse by uncommenting out the `multiverse` lines in `/etc/apt/sources.list`
2. Install OpenSCAD by running:

		sudo add-apt-repository ppa:chrysn/openscad
		sudo apt-get update
		sudo apt-get install openscad

### Server Setup

1. Install Apache, Git, and CGI::Simple

		sudo apt-get install apache2 git libcgi-simple-perl

2. Clone this git repository, or your own fork, onto your server.
3. Give the Apache user permission to work in the `work` directory:
	* `chgrp www-data /path/to/toadinator/work`
	* `chmod g+w /path/to/toadinator/work`
4. Create a new site in `/etc/apache2/sites-available` with the following:
	* `DocumentRoot` at `/path/to/toadinator/web`
	* `ScriptAlias` (with `ExecCGI` option) at `/path/to/toadinator/cgi-bin/`
5. Enable your site and restart Apache!

Implementation
==============

Toadinator is a simple HTML5 app with an even simpler backend.

Frontend Technologies
---------------------

* [Twitter's Bootstrap](http://twitter.github.com/bootstrap/) - CSS
* [jQuery](http://jquery.com/) - Yay, jQuery!
* [jQuery UI](http://jqueryui.com/) - Mmm, sliders
* [canvg](http://code.google.com/p/canvg/) - Getting SVG data into Canvas sucks. This makes it suck slightly less.

Backend Technologies
--------------------

* Apache
* A single Perl CGI script
* [OpenSCAD](http://openscad.org) - Awesome solid modeling language

3D Models
---------

The main 3D models were created using AutoCAD and OpenSCAD.

Thanks to Tony Buser for the pin connectors in his [Toy Robot Toolkit](www.thingiverse.com/thing:11189)!

Contributors
============

* [Marty McGuire](http://github.com/martymcguire/)
* [Amy Hurst](http://www.amyhurst.com/)
* [John Cutonilli](http://baltimorenode.org/)
* [Todd Blatt](http://ttbcad.com/)
