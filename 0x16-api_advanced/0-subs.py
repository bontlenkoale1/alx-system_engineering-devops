#!/usr/bin/python3
"""Function to query subscribers on a given Reddit subreddit."""
import requests

def number_of_subscribers(subreddit):
    """Return the number of subscribers for a given subreddit."""
    url = "https://www.reddit.com/r/{}/about/.json".format(subreddit)
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"
    }

    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 404:
        return 0

    try:
        # Extract the number of subscribers from the JSON response
        subscribers = response.json()["data"]["subscribers"]
        return subscribers
    except KeyError:
        # Handle unexpected JSON structure
        return 0

if __name__ == "__main__":
    
import sys

    if len(sys.argv) < 2:
        print("Please pass an argument for the subreddit to search.")
    else:
        subreddit_name = sys.argv[1]
        subscribers_count = number_of_subscribers(subreddit_name)
        print("{:d}".format(subscribers_count))
