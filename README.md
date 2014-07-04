When using `wget -rk` to locally mirror a website, wget misses to do some
things which these two scripts fix:

 - if a url contains a GET query string like
   http://mysite.com/foo?bar=baz&blub=bla then a file with name
   `foo?bar=baz&blub=bla` gets saved. The links from other documents to this
   file do not get urlencoded. This is fixed by `urlencode.py`.
 - if the copy is put online then the webserver will most likely determine the
   content type of the static content by the filename extension. But files that
   are saved under a name like `foo?bar=baz&blub=bla` do not have a recognized
   extension. This is fixed by `filenameext.sh`.

Both scripts together allowed to fix a mirror of a phpbb forum for me.
