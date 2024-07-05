aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 992382567875.dkr.ecr.us-east-1.amazonaws.com

docker build -t varvashenko-ecr-image .

docker tag varvashenko-ecr-image 992382567875.dkr.ecr.us-east-1.amazonaws.com/varvashenko-ecr:latest
docker tag varvashenko-ecr-image 992382567875.dkr.ecr.us-east-1.amazonaws.com/varvashenko-ecr:alpha

docker push 992382567875.dkr.ecr.us-east-1.amazonaws.com/varvashenko-ecr:latest
docker push 992382567875.dkr.ecr.us-east-1.amazonaws.com/varvashenko-ecr:alpha
