# Erlang Project Initialization Skill 🚀

A reusable AI Agent Skill for initializing standard Erlang projects following our conventions.
This skill is designed to work with AI coding agents (like Claude Code).

## ✨ Features

- **Standard OTP Structure**: Automatically creates `src/`, `test/`, and `include/` directories.
- **`erlang.mk` Built-in**: Downloads the latest `erlang.mk` and configures a standard `Makefile`.
- **Erlang Language Platform (ELP)**: Generates a pre-configured `.elp.toml` for IDE support and linting.
- **GitHub Actions Ready**: Includes a `.github/workflows/ci.yml` that runs `make local` on every push.
- **Testing Support**: Pre-configures `meck` as a test dependency.
- **Clean Git State**: Includes a comprehensive `.gitignore` for Erlang and macOS environments.

## 📂 Project Structure

```text
.
├── SKILL.md              # Skill definition for AI agents
├── scripts/
│   └── init.sh           # Core initialization logic
└── resources/
    └── templates/        # Boilerplate templates for Makefile, ELP, CI, etc.
```

## 🛠️ Installation

Clone this repository to your local workspace where your AI agent can access it:

```bash
git clone https://github.com/rw00/skill-init-erl-mk-project.git
```

## 🚀 Usage

### For AI Agents

If you are using an AI agent, you can simply point it to the `SKILL.md` file.
It will understand how to use the `scripts/init.sh` to scaffold your new project.

### Manual Usage

You can also use the initialization script directly from your terminal:

```bash
# Usage: ./init.sh <project_name> <target_directory> <path_to_skill_root>
./scripts/init.sh my_awesome_app . /path/to/skill-init-erl-mk-project
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Merge Request.

## 📜 License

This project is open-source and available under the MIT License.
