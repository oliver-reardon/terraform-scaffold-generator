.PHONY: help new

NAME ?= my-project
n ?= $(NAME)
OUTPUT ?= .
o ?= $(OUTPUT)

help: ## Show this help
	@echo "Terraform Scaffold Generator"
	@echo ""
	@echo "Usage: make new n=project-name [o=output-dir]"
	@echo "Defaults: n=my-project, o=current-directory"
	@echo ""
	@awk 'BEGIN {FS = ":.*?## "}; /^[a-zA-Z0-9_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

new: ## Create new project from template
	@if [ -z "$(n)" ]; then echo "Please specify NAME=name or n=name"; exit 1; fi
	@if [ ! -d "template" ]; then echo "Missing template/ directory"; exit 1; fi
	@mkdir -p "$(o)"
	@if [ -d "$(o)/$(n)" ]; then echo "Directory $(o)/$(n) already exists"; exit 1; fi
	@echo "Creating terraform project: $(n) in $(o)"
	@cp -r template "$(o)/$(n)"
	@find "$(o)/$(n)" -type f \( -name '*.tfvars' -o -name '.header.md' \) -exec sed -i.bak 's/my-project/$(n)/g' {} +
	@find "$(o)/$(n)" -name '*.bak' -delete
	@echo "Done! Run: cd $(o)/$(n)"
