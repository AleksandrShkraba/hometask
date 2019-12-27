import argparse
from github import Github

parser = argparse.ArgumentParser()
parser.add_argument('--owner', nargs=1, help="write repo owner", required=True)
parser.add_argument('--repo', nargs=1, help="write name of repo", required=True)
parser.add_argument('--user', action='store_true', help="get login of user which create request",
                    required=False)
parser.add_argument('--com', action='store_true', help="get number of commits for pull request",
                    required=False)
parser.add_argument('--state', action='store_true', help="get state of pullrequest", required=False)
parser.add_argument('--comment', action='store_true', help="get write number of comments",
                    required=False)

args = parser.parse_args()

credentials = Github("USERNAME", "PASSWORD")
repo = credentials.get_repo(args.owner[0] + '/' + args.repo[0])
pull = repo.get_pulls()

for pr in pull:
    data = pr.title + " "

    if args.user:
        data = data + " " + str(pr.user)
    if args.com:
        data = data + " " + str(pr.commits) + "commits"
    if args.state:
        data = data + " " + pr.state
    if args.comment:
        data = data + " " + str(pr.comments) + "comments"
    print(data)
