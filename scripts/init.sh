#!/bin/bash
set -e

# Usage: ./init.sh <project_name> <skill_dir> [target_dir]

PROJECT_NAME=$1
SKILL_DIR=$2
TARGET_DIR=$3

if [ -z "$PROJECT_NAME" ]; then
    echo "Error: Project name is required"
    exit 1
fi

if [ -z "$SKILL_DIR" ]; then
    echo "Error: Skill directory is required"
    exit 1
fi

if [ -z "$TARGET_DIR" ]; then
    TARGET_DIR="."
fi

echo "Initializing Erlang project: $PROJECT_NAME in $TARGET_DIR"

# Create directories
mkdir -p "$TARGET_DIR/src" "$TARGET_DIR/test" "$TARGET_DIR/include" "$TARGET_DIR/.github/workflows"

# Replace placeholders
render_template() {
    local template=$1
    local output=$2
    sed "s/{{project_name}}/$PROJECT_NAME/g; s/{{project_description}}/$PROJECT_NAME application/g" "$template" > "$output"
}

# Render templates
render_template "$SKILL_DIR/resources/templates/Makefile.template" "$TARGET_DIR/Makefile"
render_template "$SKILL_DIR/resources/templates/elp.toml.template" "$TARGET_DIR/.elp.toml"
render_template "$SKILL_DIR/resources/templates/gitignore.template" "$TARGET_DIR/.gitignore"
render_template "$SKILL_DIR/resources/templates/github_ci.yml.template" "$TARGET_DIR/.github/workflows/ci.yml"
render_template "$SKILL_DIR/resources/templates/app_src.template" "$TARGET_DIR/src/$PROJECT_NAME.app.src"
render_template "$SKILL_DIR/resources/templates/app.erl.template" "$TARGET_DIR/src/${PROJECT_NAME}_app.erl"
render_template "$SKILL_DIR/resources/templates/sup.erl.template" "$TARGET_DIR/src/${PROJECT_NAME}_sup.erl"

echo "Downloading erlang.mk..."
curl -L -o "$TARGET_DIR/erlang.mk" https://erlang.mk/erlang.mk

echo "Project $PROJECT_NAME initialized successfully!"
