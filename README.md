# Terraform Scaffold Generator

This repository helps you quickly scaffold new Terraform projects from a reusable template.

## Available Commands

Run this in the repo root to see commands:

```bash
make help
```

## Creating a New Project

To create a new Terraform project from the template, run:

```bash
make new n=my-project-name
```

You can also specify a custom output directory:

```bash
make new n=my-project-name o=./projects
```

This will:

- Copy the `template/` directory to the specified location
- Replace all instances of `my-project` inside `.tfvars` and `.header.md` files with your project name
- Create a ready-to-use Terraform project

## Updating Terraform Module Documentation

Each generated project includes a Makefile to simplify documentation and formatting tasks.

### How it works:
1. Edit `.header.md` with your project description and usage instructions
2. Add comments to your Terraform variables and outputs
3. Use the project Makefile to format and generate docs

### Update the docs:
```bash
cd my-project-name

# Format your Terraform files (default: terraform/ folder)
make fmt

# Format files in a specific path
make fmt p=modules/networking

# Generate documentation (default: terraform/ folder)
make docs

# Generate docs for a specific path
make docs p=modules/networking
```

The generated `README.md` will contain:
- Your custom header from `.header.md`
- Auto-generated tables of inputs (variables)
- Auto-generated tables of outputs
- Provider requirements
- Resource documentation

## Requirements

- `make`
- `sed` (GNU or BSD compatible)
- `terraform-docs` (for generating documentation)

## Notes

- The `template/` directory contains your Terraform boilerplate and config files
- Customize the template as needed for your workflow

## Template Structure

```
template/
├── terraform/
│   ├── locals.tf       # Local values and naming conventions
│   ├── main.tf         # Main Terraform resources
│   ├── outputs.tf      # Output definitions
│   ├── providers.tf    # Provider configurations
│   ├── variables.tf    # Variable definitions
│   └── versions.tf     # Version constraints
├── environments/
│   ├── dev.tfvars      # Development environment variables
│   ├── staging.tfvars  # Staging environment variables
│   └── prod.tfvars     # Production environment variables
├── .gitignore          # Git ignore patterns
├── .header.md          # Custom header for documentation
├── .terraform-docs.yml # Terraform-docs configuration
└── Makefile            # Project automation (fmt, docs)
```
