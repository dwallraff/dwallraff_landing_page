#! /usr/bin/env bash
#-- Dave Wallraff

# First things first, I'm the realest...

echo "Building site ..."

# Build the project.
hugo --theme=vncnt-hugo

# Go To Public folder
cd public || exit
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date "+%Y%m%d")"
if [ $# -eq 1 ]
  then msg="$1"
fi

git commit -m "$msg"

# Push source and build repos.

echo "Pushing to GitHub..."
git push origin master

# Come Back up to the Project Root
cd .. || exit