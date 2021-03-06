#!/bin/bash
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.0
source /usr/local/rvm/scripts/rvm

echo "Check if env variable exists: " $PUBLIC_RabbitMQ_Required_by_Worker
echo `pwd`
cd hyperflow-deployment/
sed -i -e "s|amqp://localhost|amqp://$PUBLIC_RabbitMQ_Required_by_Worker|" attributes/hyperflow-md-worker.json
install.sh attributes/hyperflow-md-worker.json
