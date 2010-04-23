HTFramework
===========

A framework of re-usable components for happier iPhone OS development

by Andy Waite <andy@huddletech.com>

Portions copyright Jeff LeMarche ( http://iphonebits.googlecode.com/ ) and Apple Inc.

Aims
----

* simple to extend and customise
* independent of any data persistence technique
* no private framework calls
* iPad support
* match the look and feel of iPhone OS and Apple's own apps by default
* follow Apple Human Interface Guidelines
* support MVC (Model View Controller) design
* convention over configuration

How to Use
----------

0. Copy the src folder into your project.
0. `#import "HTFramework.h"`

Look in Catalog/Classes/Examples to see how each screen is built. Usually it's just a case of subclassing one of the controllers and overriding viewDidLoad. Watch the debugger console to see the delegate methods in action.

For support, please post on the Google Group at "http://groups.google.com/group/htframework":http://groups.google.com/group/htframework