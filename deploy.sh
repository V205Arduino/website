#cd 
#cd website
ls

export COMMIT_HASH=$(git rev-parse HEAD) 
#date +"%r"

#export BUILD_TIME=$(date +"%r")
export BUILD_TIME=$(date)
npm run build
cp -r dist output_done