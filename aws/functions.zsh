function ssh-aws() {
    # ssh-aws username hostname
    IP=$(aws ec2 describe-instances --filters="Name=tag:Name,Values=$2" | jq -r '.Reservations[0].Instances[0].PublicIpAddress')
    ssh $1@$IP
}

function ssh-aws-by-id() {
    # ssh-aws-by-id username hostID
    IP=$(aws ec2 describe-instances --instance-ids $2 | jq -r '.Reservations[0].Instances[0].PublicIpAddress')
    ssh $1@$IP
}
