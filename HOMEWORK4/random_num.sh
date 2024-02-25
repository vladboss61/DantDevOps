#/bin/bash

RANDOM_NUMBER=$RANDOM

echo "$RANDOM_NUMBER"

ATTEMPT=1

while [ $ATTEMPT -le 5 ]
do
	read -p "Your guess number: " usr_number
	echo "$usr_number"

	if [[ $usr_number -eq $RANDOM_NUMBER ]]
	then
		echo "Congratulations! Your guest is right number."
		exit
	fi

	if [[ $usr_number -le $RANDOM_NUMBER ]]
	then
		echo "Too low"
	fi

	if [[ $usr_number -ge $RANDOM_NUMBER ]]
	then
		echo "Too high"
	fi
	echo "$ATTEMPT"
	ATTEMPT=$(($ATTEMPT + 1))
done

echo "Sorry, I have run out of the attempts. The correct number was [$RANDOM_NUMBER]"

