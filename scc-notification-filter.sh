#!/bin/bash
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

clear
echo -e ${YELLOW}"What is your organization id?" ${NC}
read organization_ID
export ORGANIZATION_ID=${organization_ID}

echo -e ${YELLOW}"What is your project id?" ${NC}
read project_ID
export PROJECT=${project_ID}

echo -e ${YELLOW}"What is your PubSub Topic?" ${NC}
read pubsub_topic
export TOPIC_ID=${pubsub_topic}

echo -e ${YELLOW}"What is the name of your filter?" ${NC}
read filter_name
export FILTER_NAME=${filter_name}

export PUBSUB_TOPIC="projects/"$PROJECT"/topics/"$TOPIC_ID
export DESCRIPTION="Custom Cloud Security Command Center Finding Notification Configuration"
export FILTER="(severity=\"HIGH\" OR severity=\"CRITICAL\") AND state=\"ACTIVE\""

clear

echo -e ${YELLOW} "Here is the command we are going to run:"${NC}

echo "gcloud scc notifications create $FILTER_NAME \
--organization "$ORGANIZATION_ID" \
--description "$DESCRIPTION" \
--pubsub-topic $PUBSUB_TOPIC \
--filter "$FILTER""

echo ""
echo ""
echo ""
while true; do
    read -p "Do you wish to install this program? (y/n) " yn
    case $yn in
        [Yy]* ) gcloud scc notifications create $FILTER_NAME --organization "$ORGANIZATION_ID" --description "$DESCRIPTION" --pubsub-topic $PUBSUB_TOPIC --filter "$FILTER";  break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

gcloud scc notifications list $ORGANIZATION_ID
