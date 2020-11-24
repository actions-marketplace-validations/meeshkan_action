#!/usr/bin/env python3

import sys
import os
import requests


MEESHKAN_CLIENT_ID = os.environ["MEESHKAN_CLIENT_ID"]
MEESHKAN_CLIENT_SECRET = os.environ["MEESHKAN_CLIENT_ID"]
MEESHKAN_URL = os.environ["MEESHKAN_URL"]
#asdf

def run_tests(client_id, client_secret, url):
    try:
        response = requests.get(url)
        if response.status_code / 100 == 2:
            print("Ok")
        else:
            sys.exit(f"Non-2xx response from {url}")
    except Exception:
        sys.exit(f"Invalid URL specified: {url}")

run_tests(MEESHKAN_CLIENT_ID, MEESHKAN_CLIENT_SECRET, MEESHKAN_URL)
