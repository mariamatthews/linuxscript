#!/bin/bash
HEIGHT=20
WIDTH=70
CHOICE_HEIGHT=10
BACKTITLE="Maria's Command runner"
TITLE="Commands"
MENU="Choose one of the following options:"

OPTIONS=(1 "Show Firewall Rules"
         2 "Edit Before Firewall Rules"
         3 "Edit default Firewall Rules"
		 4 "View running services only"
		 5 "Check connection"
		 6 "Reload services"
		 7 "Show iptables for the NAT table"
		 8 "Show iptables for the PREROUTING NAT table"
		 9 "Show iptables for the POSTROUTING NAT table"
		 10 "Show iptables for all tables")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "ufw verbose"
            ufw verbose
            ;;
        2)
            echo "nano /etc/ufw/before.rules"
            nano /etc/ufw/before.rules
            ;;
        3)
            echo "nano /etc/default/ufw"
            nano /etc/default/ufw
            ;;
		4)
            echo "systemctl --type=service --state=running"
            systemctl --type=service --state=running
            ;;
        5)
            echo "dig google.com ANY +noall +answer"
            dig google.com ANY +noall +answer
            ;;
        6)
            echo "sysctl -p"
            sysctl -p
            ;;
        7)
            echo "iptables -t nat -v -L -n --line-number"
            iptables -t nat -v -L -n --line-number
            ;;
        8)
            echo "iptables -t nat -v -L PREROUTING -n --line-number"
            iptables -t nat -v -L PREROUTING -n --line-number
            ;;
        9)
            echo "iptables -t nat -v -L POSTROUTING -n --line-number"
            iptables -t nat -v -L POSTROUTING -n --line-number
            ;;
        10)
            echo " iptables -v -L -n --line-number"
            iptables -v -L -n --line-number
            ;;
esac
