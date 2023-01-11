#php paigaldusskript
#
#kontrollime, mitu korda php7.x  korral ok installed
#sõnad on leitud ja vastus salvestame
#muutuja sisse:
PHP=$(dpkg-query -W -f='${Status}' php 2>/dev/null | grep -c 'ok installed')
#kui PHP muutuja väärtus võrdub 0-ga
if [ $PHP -eq 0 ]; then
	#siis on installed ei ole leitud
	#ja väljastame vastava teate ning
	#paigaldame teenuse
	echo "Paigaldame php ja vajalikud lisad"
	apt install php libapache2-mod-php php-mysql
	echo "php on paigaldatud"
#kui PHP muutuja väärtus võrdub 1-ga
elif [ $PHP -eq 1 ]; then
	#siis ok installed on leitud 1 kord
	#ja teenus on juba paigaldatud
	echo "php on juba paigaldatud"
	#kontrollime olemasolu
	php -v
#lõpetame tingimuslause
fi
#skirpti lõpp
