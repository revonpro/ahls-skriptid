#mysql paigaldus skript
#
#kontrollime mitu korda mysql-server korral ok installed
#sõnad on leitud ja vastuse salvestame
#muutuja sisse:
MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed')
#kui MYSQL muutuja väärtus võrdub 0-ga
if [ $MYSQL -eq 0 ]; then
	#siis ok installed ei ole leitud
	# ja väljastame vastava teate ning
	#paigaldame teenuse
	echo "Paigaldame mysql ja vajalikud lisad"
	wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
	apt install ./mysql-apt-config_0.8.22-1_all.deb
	apt install mysql-server
	echo "mysql on paigaldatud"
	#lisame võimaluse kasutada mysql käske ilma kasutaja ja parooli lisamiseta
	touch $HOME/.my.cnf #lisame vajaliku konf faili anutd kasutaja kodukausta
	echo "[client]" >> $HOME/.my.cnf
	echo "host = localhost" >> $HOME/.my.cnf
	echo "user = root" >> $HOME/.my.cnf
	echo "password = qwerty" >> $HOME/.my.cnf
#kui MYSQL muutuja väärtus võrdub 1-ga
elif [ $MYSQL -eq 1 ]; then
	#siis ok installed on leitud 1 kord
	#ja teenus on juba paigaldatud
	echo "mysql-server on juba paigaldatud"
	#kontrollime olemasolu
	service mysql status
#lõpetame tingimuslause
fi
#skripti lõpp :)
