1. Deploy code (need new key pair and IAM user for creds)
2. Log into ansible create hosts file under /opt
3. Add key pair in /opt directory
4. test connection to hosts ansible all -i hosts all -m ping
5. Create and run playbooks
6. Log into jenkins on master ec2 public IP:8080

* Useful commands

- ansible-playbook -i /opt/hosts jenkins-build-node-setup.yaml --check
- ansible all -i hosts all -m ping