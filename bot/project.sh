#!/bin/bash
history -c 
rm -fr project.sh
rm -fr /etc/bot//xdxl
rm -fr /usr/bin/xdbot.zip*
#color
NC='\e[0m'
u="\033[1;36m"
y="\033[1;93m"
g="\033[1;92m"
r="\033[1;91m"
url_izin="https://raw.githubusercontent.com/silahosting/izinsc/main/ip"
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
checking_sc() {
  useexp=$(wget -qO- $url_izin | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mWhatsapp${NC} wa.me/6283824505310"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
REPO="https://raw.githubusercontent.com/silahosting/vvip/main/bot/"
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#install
mkdir -p /etc/bot
apt update && apt upgrade
apt install neofetch -y
apt install python3 python3-pip git
cd /usr/bin
wget -q -O bot.zip "${REPO}bot.zip"
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
cd
cd /etc/bot
wget -q -O xdbot.zip "${REPO}xbot.zip"
unzip xdbot.zip
pip3 install -r xdxl/requirements.txt

clear
echo ""
figlet 'BAYU STORE' | lolcat
echo -e "$u ┌────────────────────────────────────────────────┐${NC}"
echo -e "$u │ \e[1;97;101m                ADD BOT PANEL                 ${NC} ${u}│${NC}"
echo -e "$u └────────────────────────────────────────────────┘${NC}"
echo -e "$u ┌────────────────────────────────────────────────┐${NC}"
echo -e "$u │ ${g}Tutorial Creat Bot and ID Telegram                   ${NC}"
echo -e "$u │ ${g}Creat Bot and Token Bot : @BotFather                 ${NC}"
echo -e "$u │ ${g}Info Id Telegram : @MissRose_bot perintah /info      ${NC}"
echo -e "$u └────────────────────────────────────────────────┘${NC}"
echo -e ""
read -e -p "  [*] Input your Bot Token : " bottoken
read -e -p "  [*] Input Your Id Telegram : " admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /etc/bot/xdxl/var.txt
echo -e ADMIN='"'$admin'"' >> /etc/bot/xdxl/var.txt
echo -e DOMAIN='"'$domain'"' >> /etc/bot/xdxl/var.txt
echo -e PUB='"'$PUB'"' >> /etc/bot/xdxl/var.txt
echo -e HOST='"'$NS'"' >> /etc/bot/xdxl/var.txt
clear

if [ -e /etc/systemd/system/ahmalasbjir.service ]; then
echo ""
else
rm -fr /etc/systemd/system/ahmalasbjir.service
fi

cat > /etc/systemd/system/ahmalasbjir.service << END
[Unit]
Description=Simple Tele Bot By @xdxl_store
ProjectAfter=network.target

[Service]
WorkingDirectory=/etc/bot
ExecStart=python3 -m xdxl
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl start ahmalasbjir
systemctl enable ahmalasbjir
systemctl restart ahmalasbjir
cd

# // STATUS SERVICE BOT
bot_service=$(systemctl status ahmalasbjir | grep active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $bot_service == "running" ]]; then 
   sts_bot="${g}Online${NC}"
else
   sts_bot="${r}Offline${NC}"
fi

rm -fr /usr/bin/bot.zip
rm -fr /usr/bin/xdbot.zip
clear
neofetch
echo -e "  ${y} Your Data BOT Info"
echo -e "  ${u}┌───────────────────────────────────┐${NC}"
echo -e "  ${u}│$r Status BOT ${y}=$NC $sts_bot "
echo -e "  ${u}│$r Token BOT  ${y}=$NC $bottoken "
echo -e "  ${u}│$r Admin ID   ${y}=$NC $admin "
echo -e "  ${u}│$r Domain     ${y}=$NC $domain "
echo -e "  ${u}│$r NS Domain  ${y}=$NC $NS "
echo -e "  ${u}└───────────────────────────────────┘${NC}"
echo -e ""
history -c
read -p " [*] Press [ Enter ] to back on menu"
menu
