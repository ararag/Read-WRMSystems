# Read-WRMSystems
Powershell script to get water meter readings from WRM-Systems web interface.

This script can be used to query water meter readings for customers of a water provider that offers their customers the https://wmd.wrm-system.fi web interface for accessing water meter readings online.
Author: Dennis Nyholm (dennis@nyholm.me)

# Instructions for use:
You need the following information in order to run this script:
1) The login URL. This is dependent on where you live and who is the water provider in your area. You get the url from your water provider.
   Edit the $loginUrl variable to reflect your login page.\
   Here are some examples:\
     -Etelä-Elimäen VOK: $baseUrl/eevok/login\
     -Leppävirran vesihuoltolaitos: $baseUrl/leppavirranvesihuoltolaitos/login\
     -Kuhmon VesiEnergia Oy: $baseUrl/kuhmonvesienergia/login\
     -Suonenjoen Vesi Oy: $baseUrl/suonenjoenvesi/login\
     -Kirkkonummen Vesi: $baseUrl/kirkkonummenvesi/login\
     -Lumijoen Vesi Oy: $baseUrl/lumijoenvesi/login\
     -Vaalan Vesi ja Lämpö: $baseUrl/vaalanvesijalampo/login\
     -Sastamalan Vesi Liikelaitos: $baseUrl/sastamalanvesi/login\
     -Pohjois-Kangasalan VHOK: $baseUrl/pohjoiskangasalanvhok/login\
     -Pyhä-Luosto Vesi Oy: $baseUrl/pyhaluostovesi/login\
     -Keski-Savon Vesi: $baseUrl/keskisavonvesi/login\
     -Oulaisten Vesiosuuskunta: $baseUrl/oulavesi/login\
     -Liedon Vesi: $baseUrl/liedonvesi/login\
     -Vesiosuuskunta Mustijoki: $baseUrl/mustijoki/login\
     -Orimattilan Vesi: $baseUrl/orimattilanvesi/login\
     -Paltamon vesihuoltolaitos: $baseUrl/paltamonvesihuoltolaitos/login\
     -Janakkalan Vesi: $baseUrl/janakkalanvesi/login\
     -Inarin Lapin Vesi Oy: $baseUrl/inarinlapinvesi/login\
     -Toivakan vesihuolto: $baseUrl/toivakanvesihuolto/login\
     -Kuusamon energia- ja vesiosuuskunta: $baseUrl/kuusamonevo/login\
     -Vihtasillan vesihuolto-osuuskunta: $baseUrl/vsvho/login\
     -Pudasjärven Vesiosuuskunta: $baseUrl/pudasjarvenvesiosuuskunta/login\
2) The E-mail and password to log on to the service. Put these in the $email and $password variables.\
3) The serial number of your water meter. This can be found on the front page once you have logged on to the service with a web browser.\

# NOTE
This script has been made for and tested only with Kirkkonummen Vesi, which uses email & password for login. Most other providers seem to use customer number and water meter number for login. I have made changes to the script to support these, but I haven't tested it with them. Please check the $loginPayload in the script.
