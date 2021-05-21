library(devtools)
library(ggmap)

apikey = 'AIzaSyDbIliCPcNLlCPOuYWiTNXI4DeA4kM4QMk'

register_google(apikey)
ggDaegu <- get_googlemap('daegu', maptype='hybrid')
ggmap(ggDaegu)
