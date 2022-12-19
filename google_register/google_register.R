# Prompting the user to enter API key
api_key <- readline(prompt="Please enter your Google API key:")

# Register to google API using the user input api_key
ggmap::register_google(key = api_key)