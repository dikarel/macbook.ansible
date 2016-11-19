# Install project pre-reqs
install:
	@ansible-galaxy install geerlingguy.homebrew

# Deploy configuration to local workstation
deploy:
	@ansible-playbook main.yml -i hosts -K

# Generate demo recording
demo: demo.gif

# Clear temporary files
clean:
	@rm -rf bin

# Test project
test:
	@ansible-playbook main.yml -i hosts --syntax-check

demo.gif: bin/tty.gif
	@mv bin/tty.gif demo.gif

bin/tty.gif: bin/demo.recording
	@cd bin && ttygif demo.recording

bin/demo.recording: Makefile main.yml
	@mkdir -p bin
	@ttyrec -e "make deploy" bin/demo.recording