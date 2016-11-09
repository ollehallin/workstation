# Styr e-postleverans

### Begin group: DEFAULT
 
# from 
from_ = u'{{ calibre.smtp.from }}'
 
# accounts
accounts = cPickle.loads('\x80\x02}q\x01(X\x13\x00\x00\x00asa_6208@kindle.com]q\x02(X\x04\x00\x00\x00MOBIq\x03\x89\x89eX\x1d\x00\x00\x00olle.hallin_kindle@kindle.com]q\x04(X\x04\x00\x00\x00MOBIq\x05\x89\x88eX\x17\x00\x00\x00hallin_petra@kindle.com]q\x06(X\x04\x00\x00\x00MOBIq\x07\x89\x89eu.')
 
# subjects
subjects = cPickle.loads('\x80\x02}q\x01(X\x13\x00\x00\x00asa_6208@kindle.comX\x00\x00\x00\x00X"\x00\x00\x00olle.hallin_kindle_olle@kindle.comX\x08\x00\x00\x00New booku.')
 
# aliases
aliases = cPickle.loads('\x80\x02}q\x01(X\x13\x00\x00\x00asa_6208@kindle.comX\x0c\x00\x00\x00\xc3\x85sas KindleX\x1d\x00\x00\x00olle.hallin_kindle@kindle.comX\x0c\x00\x00\x00Olles KindleX\x17\x00\x00\x00hallin_petra@kindle.comX\r\x00\x00\x00Petras KindleX"\x00\x00\x00olle.hallin_kindle_olle@kindle.comX\x0c\x00\x00\x00Olles Kindleu.')
 
# relay host
relay_host = u'{{ calibre.smtp.relay.host }}'
 
# relay port
relay_port = {{ calibre.smtp.relay.port }}
 
# relay username
relay_username = u'{{ calibre.smtp.relay.username }}'
 
# relay password
relay_password = '{{ calibre.smtp.relay.password }}'
 
# encryption
encryption = '{{ calibre.smtp.relay.encryption }}'
