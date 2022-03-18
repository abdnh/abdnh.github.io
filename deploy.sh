#!/bin/bash

# Based on https://github.com/yegor256/jekyll-github-deploy/blob/master/bash/deploy.sh

set -x
set -e
set -o pipefail

URL=$(git config --get remote.origin.url)
# CLONE_FROM="."
BRANCH="gh-pages"
BRANCH_FROM="master"
# DEPLOY_CONFIG="_config_deploy.yml"
# BUNDLE="bundle exec"
BUNDLE=""
DRAFTS=$6
SRC=$(pwd)
TEMP=$(mktemp -d -t jgd-XXX)
trap "rm -rf ${TEMP}" EXIT
CLONE=${TEMP}/clone
COPY=${TEMP}/copy

echo ${CLONE}

echo -e "Cloning Github repository:"
git clone -b "${BRANCH_FROM}" "${URL}" "${CLONE}"
cp -R ${CLONE} ${COPY}

cd "${CLONE}"

echo -e "\nBuilding Jekyll site:"
rm -rf _site

# popd
# if [ -r ${DEPLOY_CONFIG} ]; then
#   ${BUNDLE} jekyll build --config _config.yml,${DEPLOY_CONFIG}
# else
#   ${BUNDLE} jekyll build
# fi
# jekyll build -d ${CLONE}/_site
jekyll build

# pushd "${CLONE}"
if [ ! -e _site ]; then
  echo -e "\nJekyll didn't generate anything in _site!"
  exit -1
fi

cp -R _site ${TEMP}

cd ${TEMP}
rm -rf ${CLONE}
mv ${COPY} ${CLONE}
cd ${CLONE}

echo -e "\nPreparing ${BRANCH} branch:"
if [ -z "$(git branch -a | grep origin/${BRANCH})" ]; then
  git checkout --orphan "${BRANCH}"
else
  git checkout "${BRANCH}"
fi

echo -e "\nDeploying into ${BRANCH} branch:"
rm -rf *
cp -R ${TEMP}/_site/* .
rm -f README.md
git add .
git commit -am "new version $(date)" --allow-empty
git push origin ${BRANCH} 2>&1 | sed 's|'$URL'|[skipped]|g'

echo -e "\nCleaning up:"
rm -rf "${CLONE}"
rm -rf "${SITE}"
