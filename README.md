# bash-reminder
A simple linux reminder in bash

# setup
```
chmod +x reminder
sudo mv reminder /usr/local/bin/reminder #to user without the ./ prefix
```
# usage
`./reminder [time expression] - [your message]`
## Hour formats
```
./reminder today 5pm - Time to go
./reminder 17:00 - Leave for gym
./reminder today 5 pm - Call mom
```
## Relative Delays
```
./reminder now + 5 minutes - Check the oven
./reminder now + 1 hour - Take a screen break
```
## Specific Target
```
./reminder 10:30 tomorrow - Team Sync Meeting
```

## Manager Active Reminders

- List active
`atq`

- Verify contents
`atq -c ID | tail -n 2`

- Cancel Active
`atrm ID`
