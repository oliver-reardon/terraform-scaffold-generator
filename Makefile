.PHONY: help new

PROJECT ?= my-project

help: ## Show this help
	@echo "Terraform Scaffold Generator"
	@echo ""
	@awk 'BEGIN {FS = ":.*?## "}; /^[a-zA-Z0-9_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

new: ## Create new project from template
	@if [ -z "$(PROJECT)" ]; then echo "❌ Please specify PROJECT=name"; exit 1; fi
	@if [ ! -d "template" ]; then echo "❌ Missing template/ directory"; exit 1; fi
	@if [ -d "$(PROJECT)" ]; then echo "❌ Directory $(PROJECT) already exists"; exit 1; fi
	@echo "🚀 Creating terraform project: $(PROJECT)"
	@cp -r template $(PROJECT)
	@find $(PROJECT) -type f \( -name '*.tfvars' -o -name '.header.md' \) -exec sed -i.bak 's/my-project/$(PROJECT)/g' {} +
	@find $(PROJECT) -name '*.bak' -delete
	@echo "✅ Done! Run: cd $(PROJECT)"
