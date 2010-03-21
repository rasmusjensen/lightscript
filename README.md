README
======

LightScript is a subscript of EcmaScript,
with a compact implementation running
on low end mobile devices.

Currently under major redevelopment.

- Documentation is available on [lightscript.net](http://www.lightscript.net/)
- Latest source code can be downloaded from [github.com/rasmusjensen/lightscript](http://github.com/rasmusjensen/lightscript)
- Updates on recent commits on [twitter.com/lightscript](http://twitter.com/lightscript)


Content
-------

- Library Reference
- Language Reference
- Implementation notes



Library Reference
=================

Standard Library
----------------
(to be more in concordance with standard soon. Non-EcmaScript-functions may change api before in next version)

- print(text)
- clone(Object)
- parseint(string, base)
- global
    - .\_\_getter\_\_(key)
    - .\_\_setter\_\_(key, val)
- *All types*
    - .toString()
    - +
- *java.util.Stack type*
    - [elem1, elem2, ...]
    - Array()
    - .\_\_getter\_\_(key)
    - .\_\_setter\_\_(key, val)
    - .\_\_iter\_\_()
    - .push(val)
    - .pop()
    - .join([seperator])
    - .slice(start[, end])
    - .concat(...)
    - Array.concat(...)
    - .sort([compare function])
    - .toTuple()
- *java.util.Hashtable type*
    - { key: val, key:val, ... }
    - Object()
    - .hasOwnProperty(x)
    - .\_\_getter\_\_(key)
    - .\_\_setter\_\_(key, val)
    - .\_\_iterator\_\_
- *java.lang.String type*
    - "..."
    - '...'
    - String()
    - .\_\_getter\_\_(key)
    - .toInt()
    - .slice(start[, end])
    - .charCodeAt(pos)
    - .concat
    - String.fromCharCode(code)
- *java.lang.Object[] type*
    - Tuple(...)
    - .sort([compare function[, start[, end]]])
    - .toArray()
- *java.lang.Integer type*
    - 123...
    - .toInt()

Midp1 library (api not stabilised)
----------------------------------

- Menu()
    - .addItem(text[, callback])
    - .show()
- TextBox(prompt[, default text], callback)
- Storage.set(key, value)
- Storage.get(key)


Language Reference
==================

