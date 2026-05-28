# bash-reminder
A simple linux reminder in bash

# setup
```
chmod +x reminder.sh
sudo cp reminder.sh /usr/local/bin/reminder.sh #to user without the ./ prefix
```
# usage
`./reminder.sh [time expression] - [your message]`
## Hour formats
```
./reminder.sh today 5pm - Time to go
./reminder.sh 17:00 - Leave for gym
./reminder.sh today 5 pm - Call mom
```
## Relative Delays
```
./reminder.sh now + 5 minutes - Check the oven
./reminder.sh now + 1 hour - Take a screen break
```
## Specific Target
```
./reminder.sh 10:30 tomorrow - Team Sync Meeting
```

## Manager Active Reminders

- List active
`atq`

- Verify contents
`atq -c ID | tail -n 2`

- Cancel Active
`atrm ID`
