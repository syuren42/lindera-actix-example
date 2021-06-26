
# See: https://docs.aws.amazon.com/ja_jp/AmazonECS/latest/developerguide/ecs-cli-tutorial-servicediscovery.html

ecs-cli configure --cluster lindera-api-cluster --region ap-northeast-1 --default-launch-type FARGATE

ecs-cli compose --project-name lindera-api-cluster \
-f docker-compose.lindera-api.yml --ecs-params ecs-params.lindera-api.yml \
service up \
--private-dns-namespace example --vpc vpc-0e3e091d22fb7e805 --enable-service-discovery


# To update the service discovery settings, update the settings for the frontend service. 
# The values that can be updated are the DNS TTL and the value for the health check custom config failure threshold.
# About health check custom config:
# https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/aws-properties-servicediscovery-service-healthcheckcustomconfig.html

# CloudFormationでService [srv-xxx] already existsが発生する

#ecs-cli compose --project-name lindera-api-cluster \
#-f docker-compose.lindera-api.yml --ecs-params ecs-params.lindera-api.yml \
#service up \
#--update-service-discovery --dns-ttl 10 --healthcheck-custom-config-failure-threshold 2