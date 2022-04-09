#!/bin/bash -e

cd /Users/harish/sprrepo/

LIST_REPO=$(ls)

count=0
echo "I Am in  $(pwd)"
for dir in $LIST_REPO
do
  echo "****************************************** I am in $dir Repo ************************************"
  cd $dir

  if [[ "$dir" == "helm-charts" ]]
  then
    
    git checkout live && git pull origin live

  elif [[ $dir == "wiki-spr" ]]
  then
    echo -n "I am in $dir nothing to Do"

  else
    git checkout master && git pull origin master
  fi

  sleep 5
  count=$((count+1))
  cd ../

  if [[ $count > 3 ]]
  then
     echo "*********************************************** All Repos pull done,THE END!!! *********************************"
     exit 0
  fi
  echo "******************************** Going forward to pull other Repos *************************"
  echo
done
