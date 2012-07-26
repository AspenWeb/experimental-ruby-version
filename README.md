Aspen (http://aspen.io) is a Python web framework that translates URLs directly
to the filesystem and uses the ^L character (ASCII page break -- you can also
use two separate characters ^ and L) to separate code and templating. This is a
port of the framework to Ruby.

### Install

```
$ git clone
$ bundle install
$ thin start -r raspen.ru
WARNING: Use the -R option to load a Rack config file
>> Thin web server (v1.4.1 codename Chromeo)
>> Maximum connections set to 1024
>> Listening on 0.0.0.0:3000, CTRL+C to stop
```

Hit up http://localhost:3000/foo.html. Here's [the source](foo.html):

```
foo = "Ruby"
^L
Greetings, <%= foo %>!
```

Page one is Ruby and page two is ERB, using page one's binding context.
