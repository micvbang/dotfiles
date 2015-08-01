#!/usr/bin/env python

import codecs

from pandocfilters import toJSONFilter, CodeBlock


def include(key, value, format, meta):
    if key == 'CodeBlock':
        ((id, classes, namevals), contents) = value
        files = [val for name, val in namevals if name == 'run']
        # Use only first file.
        with codecs.open(files[0], 'r', 'utf8') as f:
            # compile and run file with given arguments
        return CodeBlock([id, classes, namevals], contents)

if __name__ == "__main__":
    toJSONFilter(include)
