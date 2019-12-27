#!/usr/bin/env python3
import argparse
import requests

user = "USERNAME"
password = "PASSWORD"

parser = argparse.ArgumentParser()
parser.add_argument("--owner", nargs=1, help="write repo owner", required=True)
parser.add_argument("--repo", nargs=1, help="write name of repo", required=True)
parser.add_argument("--number", nargs=1, help="write number of pullrequest", required=True)
parser.add_argument("--status", action="store_true",
                    help="Pull request status")
parser.add_argument("--created", action="store_true", help="Date of creating")
parser.add_argument("--commits", action="store_true",
                    help="Number of commits")
parser.add_argument("--comments", action="store_true",
                    help="Number of comments")
parser.add_argument("--user", action="store_true", help="User who open")

args = parser.parse_args()

req = requests.get(
    'https://api.github.com/repos/' + args.owner[0] + '/' + args.repo[0] + '/pulls/' + args.number[
        0] + ".json", auth=(user, password))

r = req.json()
data = r['title']
if args.created:
    data = data + " Created: " + r['created_at']

if args.status:
    data = data + " Request_status: " + r['labels'][0]['name']

if args.user:
    data = data + " Opened_by: " + r['head']['repo']['owner']['login'] + " "

if args.commits:
    data = data + " Number_of_commits: " + str(r['commits'])

if args.comments:
    data = data + " Number_of_comments: " + str(r['comments'])

print(data)
