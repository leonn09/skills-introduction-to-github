#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?"

MAIN_MENU() {
  echo "$($PSQL "SELECT * FROM services")" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED

  if [[ -z $SERVICE_ID_SELECTED || ( $SERVICE_ID_SELECTED -le 0 || $SERVICE_ID_SELECTED > 5 ) ]]
  then
    echo -e "\nI could not find that service. What would you like today?"
    MAIN_MENU
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_PHONE_RESULT="$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")"

    if [[ -z $CUSTOMER_PHONE_RESULT ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      SERVICE_NAME="$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")"

      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME

      NEW_CUSTOMER_INSERT="$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")"
      NEW_CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")"
      NEW_APPOINTMENT_INSERT="$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($NEW_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")"

      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      #find phone
    fi
  fi
}

MAIN_MENU