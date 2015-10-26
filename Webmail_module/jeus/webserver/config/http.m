*DOMAIN
gwap

*NODE
gw-ap2
  WEBTOBDIR = "/opt/jeusgw/webserver",
  SHMKEY    = 54000,
  DOCROOT   = "/handy/hip/htdocs",
  PORT      = "80",
  LOGGING   = "log1",
  ERRORLOG  = "log2",
  SYSLOG    = "syslog",
  JSVPORT   = 9900,
  IPCPERM   = 0777,
  HTH       = 1


*SVRGROUP
htmlg       SVRTYPE  = HTML
jsvg        SVRTYPE  = JSV

*SERVER
html        SVGNAME  = htmlg, MinProc = 100,  MaxProc = 100
MyGroup     SVGNAME  = jsvg,  MinProc = 50,   MaxProc = 100

*URI
uri4        Uri      = "/wma",      Svrtype = JSV
uri5        Uri      = "/servlet/", Svrtype = JSV
uri6        Uri      = "/kibs",     Svrtype = JSV
uri7        Uri      = "/popup",    Svrtype = JSV

*ALIAS
alias2      URI      = "/sign/",      RealPath = "/handy/hip/data/id/"
alias3      URI      = "/cimg/",      RealPath = "/handy/hip/data/tmp/cimg/"
alias4      URI      = "/org/",       RealPath = "/handy/hip/data/org/"
alias5      URI      = "/form/",      RealPath = "/handy/hip/data/form/"
alias6      URI      = "/boardhome/", RealPath = "/handy/hip/data/boardhome/"
alias7      URI      = "/reuse/",     RealPath = "/handy/hip/data/tmp/reuse/"
alias8      URI      = "/news/",      RealPath = "/handy/kftc/news/"

*LOGGING
log1        Format   = "DEFAULT",   FileName = "/home/log/webtobgw/access.log_%Y%%M%%D%"
log2        Format   = "ERROR",     FileName = "/home/log/webtobgw/error.log_%Y%%M%%D%"
syslog      Format   = "SYSLOG",    FileName = "/home/log/webtobgw/system.log_%Y%%M%%D%"

*ERRORDOCUMENT
Ercode1     Status   = 403, Url = "/si4biz/error/403.html"
Ercode2     Status   = 404, Url = "/si4biz/error/404.html"

*EXT
htm         MimeType = "text/html",            SvrType = HTML
jsp         Mimetype = "application/jsp",      Svrtype = JSV
do          Mimetype = "application/servlet",  Svrtype = JSV
