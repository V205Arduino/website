cd 
cd website
export COMMIT_HASH=$(git rev-parse HEAD) 
date +"%r"

export BUILD_TIME=$(date +"%r")
npm run build
cp -r .dist output_done
