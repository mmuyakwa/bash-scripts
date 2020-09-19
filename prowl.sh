#!/usr/bin/env bash

usage()
{
  echo "
Usage: prowl.sh (-vr) [-s Subject] [-a Application] (-p Priority {-2 => 2})  message
Try 'prowl.sh -h' for more information."
  exit 1
}

help()
{
  echo "
Usage: prowl.sh (-vr) [-s Subject] [-a Application] (-p Priority {-2 => 2})  message

Options:
  -s SUBJECT (Required)
    The subject line of the message that is being sent
  -a APPLICATION (Required)
    The application the message is coming from
  -p {-2 => 2}
    The priority of the message.
  -h
    Shows this help text"
  exit 1
}

#set the API key from the environment variable
if [ ! -z "$PROWL_APIKEY" ]; then
  API_KEY=$PROWL_APIKEY
else
  echo "Prowl API Key not set as an environment variable. Add \"export PROWL_APIKEY={key}\" to your .bash_profile or .profile"
  exit 1
fi

#Set defaults
PRIORITY=0

# process options
while getopts s:a:p:vrh o
do  case "$o" in
  s) SUBJECT=$OPTARG;;
  a) APPLICATION=$OPTARG;;
  p) PRIORITY=$OPTARG;;
  h) help;;
[?]) usage;;
  esac
done
# shift the option values out
shift $(("$OPTIND" - 1))

#use everything but the options as the message to send
MESSAGE=$*

#Ensure subject is supplied as it's required
if [ -z "$SUBJECT" ]; then
  echo "Subject is required. Use \"-s\" to set it."
  usage
  exit 1
fi

#Ensure app is supplied as it's required
if [ -z "$APPLICATION" ]; then
  echo "Application is required. Use \"-a\" to set it."
  usage
  exit 1
fi

if [ "$PRIORITY" -lt "-2" ]; then
  echo "Priority cannoy be lower than -2 (Very Low)"
  usage
  exit 1
fi

if [ "$PRIORITY" -gt "2" ]; then
  echo "Priority cannoy be higher than 2 (Emergency)"
  usage
  exit 1
fi

#Ensure that a message was provided after argument parsing
if [ -z "$MESSAGE" ]; then
  echo "No message was provided to send."
  usage
  exit 1
fi

# Send off the message to prowl
call=$(curl -s -d "apikey=$API_KEY&priority=$PRIORITY&application=$APPLICATION&event=$SUBJECT&description=$MESSAGE" https://api.prowlapp.com/publicapi/add)
