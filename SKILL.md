---
name: init-erl-mk-project
description: Initializes a new Makefile-based Erlang project according to our conventions.
---

# Erlang Project Initialization Skill

This skill automates the creation of a new Erlang project following our conventions,
including `erlang.mk` build tool and `.elp.toml` config.

## Features

- Standard directory structure: `src/`, `test/`, `include/`.
- `.elp.toml` config for Erlang Language Platform support in the IDE.
- Latest `erlang.mk` build tool.
- Pre-configured `Makefile` with `meck` for testing.
- GitHub Actions CI (`make local`).
- Default `.gitignore`.

## Usage Instructions

To initialize a new project, run the following command from the root of your desired project directory:

```bash
# Provide the project name and the path to the skill.
# Target directory defaults to '.' if not specified.
{{skill_dir}}/scripts/init.sh <project_name> {{skill_dir}} [target_dir]
```

### Steps taken by this skill:

1. Creates the directory hierarchy.
2. Downloads the latest `erlang.mk`.
3. Creates `Makefile` and `.elp.toml` from templates.
4. Configures a GitHub Action for CI.

## Resources

- `resources/templates/`: Contains all file templates used for initialization.
- `scripts/init.sh`: The core logic for project setup.
