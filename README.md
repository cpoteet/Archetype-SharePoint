Archetype-SharePoint
====================

It's important to note that the master page is only for 2013 (on-prem and Office 365), but the layouts and SASS should work in 2010 also. The master page is based heavily on [Randy Drisgill's 2013 starter master page project](https://startermasterpages.codeplex.com/).

## Deployment and Use

With the advent of Design Manager, I now store all files in the master page gallery. I keep the master page and page layouts in the root of the library. In on-prem I also store the stylesheets and other folders in the root, but in Office 365 due to all internationalization folders I create a folder to store the stylesheet and project assets.

## Reusing the Master Page

You'll notice that there is only a publishing master page, and that is because I believe [publishing is the only way to go](http://www.siolon.com/blog/the-superiority-of-sharepoint-publishing-sites-over-team-sites/) in SharePoint versions that support it.

If you're careful and intentional, you can resuse one master page for both search and the system master page. You will most likely be hiding the quick launch for search, but that is easy to handle. If you want to reuse it for system, I suggest you start designing your UI as a fluid one and use layouts to make it fixed (fixed widths don't work well at all for system pages). Worst case scenario you can fork the base master page into a search one that removes the quick launch and a system one that is fluid rather than fixed. It simply depends on your project needs.

## SASS

The SASS is also conextualized to SharePoint needs removing Normalize.css and focusing on webparts instead of "components" and layouts instead of "main." I compile all my SASS into the master page gallery as I mention above. If you need help working with SASS and SharePoint [I created a step-by-step guide](http://www.siolon.com/blog/using-sass-with-sharepoint/) to setting it up.

## Page Layout

The page layout is simply a base to show you what I need on the majority of my layouts. It includes the following:

* The necessary CSS to handle the MSFT CSS layout API (and sample markup to use it). Be sure if you want to use it you familiarize yourself with display: table-cell since it uses that layout mechanism.
* An example of inserting a web part zone into the master page. It is optional.
* Overwrites the page title using a metadata value.
* An example of how to reference metadata values without having it turn into a form on edit.
* Finally and editmodepanel is included to demonstrated an inline metadata editing experience.
