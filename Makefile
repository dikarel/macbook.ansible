# Install project pre-reqs
install:
	@ansible-galaxy install geerlingguy.homebrew

# Deploy configuration to local workstation
deploy:
	@ansible-playbook main.yml -K