#!/usr/bin/env python

import codecs
from os import path

try:
    from pandocfilters import toJSONFilter, CodeBlock
except Exception, e:
    print e


def include(key, value, format, meta):
    if key == 'CodeBlock':
        ((id, classes, namevals), contents) = value
        files = [val for name, val in namevals if name == 'include']

        p = files[0] if files else ''
        if not files or not path.exists(p):
            return CodeBlock([id, classes, namevals], contents)

        with codecs.open(p, 'r', 'utf8') as f:
            contents = f.read()
        return CodeBlock([id, classes, namevals], contents)

if __name__ == "__main__":
    toJSONFilter(include)
