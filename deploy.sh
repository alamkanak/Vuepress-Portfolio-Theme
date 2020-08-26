#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run docs:build

# Clone the deployment repo
git clone https://github.com/alamkanak/alamkanak.github.io.git gitpush
cd gitpush

# Delete all previous files in the repo
find . -type f \! \( -regex "\.\/\..*" -or -name '.' \) -exec rm -f {} +
find . -type d \! \( -regex "\.\/.*\/.*" -or -name '.' -or -name '.git' \)  -exec rm -r {} +
cd ..

# Copy new dist files to the repo
cp -r docs/.vuepress/dist/. gitpush
cd gitpush


# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

# Commit to git
git add -A
git commit -m 'Deploy'

# if you are deploying to https://<USERNAME>.github.io
git push -f https://github.com/alamkanak/alamkanak.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages

cd ..
rm -r gitpush