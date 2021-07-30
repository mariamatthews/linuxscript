#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=(1 "Show Firewall Rules"
		 2 "Edit Before Firewall Rules"
		 3 "Edit default Firewall Rules"
		 4 "View running services only"
		 5 "Check connection"
		 6 "Reload services"
		 7 "Show iptables for the NAT table"
		 8 "Show iptables for the PREROUTING NAT table"
		 9 "Show iptables for the POSTROUTING NAT table"
		 10 "Show iptables for all tables"
		 11 "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Show Firewall Rules")
            echo "ufw verbose"
            ufw verbose
            ;;
        "Edit Before Firewall Rules")
            echo "nano /etc/ufw/before.rules"
            nano /etc/ufw/before.rules
            ;;
        "Edit default Firewall Rules")
            echo "nano /etc/default/ufw"
            nano /etc/default/ufw
            ;;
        "View running services only")
            echo "systemctl --type=service --state=running"
            systemctl --type=service --state=running
            ;;
        "Check connection")
            echo "dig google.com ANY +noall +answer"
            dig google.com ANY +noall +answer
            ;;
        "Reload services")
            echo "sysctl -p"
            sysctl -p
            ;;
        "Show iptables for the NAT table")
            echo "iptables -t nat -v -L -n --line-number"
            iptables -t nat -v -L -n --line-number
            ;;
        "Show iptables for the PREROUTING NAT table")
            echo "iptables -t nat -v -L PREROUTING -n --line-number"
            iptables -t nat -v -L PREROUTING -n --line-number
            ;;
        "Show iptables for the POSTROUTING NAT table")
            echo "iptables -t nat -v -L POSTROUTING -n --line-number"
            iptables -t nat -v -L POSTROUTING -n --line-number
            ;;
        "Show iptables for all tables")
            cho " iptables -v -L -n --line-number"
            iptables -v -L -n --line-number
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done