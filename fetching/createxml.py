from xml.dom.minidom import *
from itertools import izip, count

def verse2div(no, verse):
    return u'<div class="par"><div class="verse" verse="{no}"><div class="verse-label">{no}</div>{verse}</div></div>'.format(
        no = no,
        verse = verse
    )

def create_xml(verses, rtl = False):
    header = u"""
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    </head>
"""

    if rtl:
        header += '    <body layout="indented" rtl="true">'
    else:
        header += '    <body layout="indented">'

    header += '\n'

#        <style>
#            .par { margin-left: .8em; text-indent: -1em; }
#            .verse-label { min-width: 2.5ex; }
#        </style>

    footer = u"""
    </body>
</html>
"""

    content = '\n'.join(verse2div(no, verse) for no, verse in izip(count(1), verses))
    return ''.join((header, content, footer))
