cd 
cd website
export COMMIT_HASH=$(git rev-parse HEAD) 
npm run build
