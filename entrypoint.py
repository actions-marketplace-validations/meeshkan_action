#!/usr/bin/env python3

import sys
import os
import requests

print("Meeshkan GitHub Action v0.8")

TESTER_ENDPOINT_URL = (
    "https://txwwxrn43i.execute-api.eu-west-1.amazonaws.com/prod/test-trigger"
)

MEESHKAN_CLIENT_ID = os.environ["MEESHKAN_CLIENT_ID"]
MEESHKAN_CLIENT_SECRET = os.environ["MEESHKAN_CLIENT_SECRET"]
MEESHKAN_URL = os.environ["MEESHKAN_URL"]

current_repository = os.environ["GITHUB_REPOSITORY"]
current_commit_branch = os.environ["GITHUB_REF"]
current_commit_hash = os.environ["GITHUB_SHA"]


def run_tests(client_id, client_secret, url):
    headers = {"meeshkan-client-secret": MEESHKAN_CLIENT_SECRET}

    test_input = {
        "client_id": client_id,
        "url": url,
        "pipeline_id": f"{current_repository}/{current_commit_branch}/{current_commit_hash}",
        "test_suite": "default",
    }

    print(f"Posting {test_input} to test runner")

    try:
        response = requests.post(TESTER_ENDPOINT_URL, json=test_input)
        if response.status_code == 200:
            print("Triggered test run")
        else:
            sys.exit(f"Internal error trigger tests: {response.status_code}")
    except Exception:
        sys.exit(f"Invalid URL specified: {url}")


run_tests(MEESHKAN_CLIENT_ID, MEESHKAN_CLIENT_SECRET, MEESHKAN_URL)
