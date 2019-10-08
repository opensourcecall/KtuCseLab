echo "---------------------------------------"
echo -e "Current Logged in User :-\n\n"$USER
echo "---------------------------------------"
echo -e "Current Shell :-\n\n"$SHELL
echo "---------------------------------------"
echo -e "Home Directory :-\n\n"$HOME
echo "---------------------------------------"
echo -e "Operatin System Type :-\n"
cat /etc/os-release
echo "---------------------------------------"
echo -e "Current Path Setting :- \n"
pwd
echo "---------------------------------------"
echo -e "No. of Users Logged in :- \n"
users | wc -w
echo "---------------------------------------"
