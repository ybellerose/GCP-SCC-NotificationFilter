# GCP-SCC-NotificationFilter
This .sh script is to create a notification filter in Security command center

This code is not ment to be used in a production environment!
Please review before usage.


## Requirements
- You need to have the Google Cloud SDK installed (pre-installed in GCP shell console)
- You have a GCP account, an ORG and a project define
- SCC need to be enable at the organization level (Free or Premium)
- SCC API need to be enable at the project level (If not, the scipt will ask you to enable it)
- Your user need to have roles/securitycenter.admin at the organization level
- You already have provision a PUBSUB topic 

- be ready to provide:
  - organization_id
  - project_id
  - Pubsub topic name
  - filter name


## Limitation
- The script is not going to validate: IAM or any values you are going to input, the command line at the end will only crash or return an error message.
- The script used a pre-define filter (change it within the code if needed)
  - FILTER="(severity=\"HIGH\" OR severity=\"CRITICAL\") AND state=\"ACTIVE\""
- The script used a pre-define description (change it within the code if needed)
  - DESCRIPTION="Custom Cloud Security Command Center Finding Notification Configuration"

## how to use it
```
git clone https://github.com/ybellerose/GCP-SCC-NotificationFilter.git
cd GCP-SCC-NotificationFilter/
chmod +x scc-notification-filter.sh
./scc-notification-filter.sh
```
