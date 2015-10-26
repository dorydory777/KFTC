*DOMAIN
jeuservice

*NODE
gw-ap1    
  WEBTOBDIR = "/opt/jeusgw/webserver", 
  SHMKEY    = 54000,
  DOCROOT   = "/opt/jeusgw/webserver/docs",
  PORT      = "8080", 
  LOGGING   = "log1",
  ERRORLOG  = "log2",
  SYSLOG = "log3",
  JSVPORT   = 9900,
  HTH       = 1
  
*SVRGROUP
htmlg       NODENAME = "gw-ap1", SVRTYPE = HTML
cgig        NODENAME = "gw-ap1", SVRTYPE = CGI
ssig        NODENAME = "gw-ap1", SVRTYPE = SSI
jsvg        NODENAME = "gw-ap1", SVRTYPE = JSV

*SERVER
html        SVGNAME  = htmlg, MinProc = 1,  MaxProc = 2, ASQCount = 1
cgi         SVGNAME  = cgig,  MinProc = 1,  MaxProc = 2
ssi         SVGNAME  = ssig,  MinProc = 1,  MaxProc = 2
MyGroup     SVGNAME  = jsvg,  MinProc = 1, MaxProc = 5

*URI
uri1        Uri      = "/cgi-bin/",  Svrtype = CGI
uri2        Uri      = "/examples/", Svrtype = JSV
uri3        Uri      = "/exploded/", Svrtype = JSV

*ALIAS
alias1      URI      = "/cgi-bin/", RealPath = "/opt/jeusgw/webserver/cgi-bin/"

*LOGGING
log1        Format   = "DEFAULT",   FileName = "/opt/jeusgw/webserver/log/access_%Y%%M%%D%.log", Option = "sync"
log2        Format   = "ERROR",     FileName = "/opt/jeusgw/webserver/log/error_%Y%%M%%D%.log",  Option = "sync"
log3        Format   = "SYSLOG",     FileName = "/opt/jeusgw/webserver/log/system_%Y%%M%%D%.log",  Option = "sync"

*EXT
htm         MimeType = "text/html",  SvrType = HTML
jsp 	       Mimetype ="application/jsp",  Svrtype=JSV
