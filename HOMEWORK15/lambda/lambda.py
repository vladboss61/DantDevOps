import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')

    tag_key = 'Environment'
    tag_value = 'Production'

    # Describe instances with the specified tag
    instances = ec2.describe_instances(
        Filters=[
            {
                'Name': f'tag:{tag_key}',
                'Values': [tag_value]
            }
        ]
    )

    # Collect instance IDs to stop
    instance_ids = []
    for reservation in instances['Reservations']:
        for instance in reservation['Instances']:
            if instance['State']['Name'] == 'running':
                instance_ids.append(instance['InstanceId'])

    # Stop instances
    if instance_ids:
        ec2.stop_instances(InstanceIds=instance_ids)
        print(f'Stopping instances: {instance_ids}')
    else:
        print('No running instances found with the specified tag.')

    return {
        'status_code': 200,
        'body': f'Stopped instances: {instance_ids}'
    }