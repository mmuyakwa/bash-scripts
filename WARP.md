# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This is a collection of bash scripts for system administration, server setup, and automation on Debian-based Linux systems. Scripts are intended primarily for development machines and personal server management.

## Architecture & Organization

### Script Structure
All scripts follow a consistent pattern:
- Standard shebang: `#!/usr/bin/env bash`
- Header block with metadata (title, description, author, created date, version, license, usage)
- SUDO detection pattern for running as non-root user:
  ```bash
  SUDO=''
  [ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }
  ```
- All apt-get commands are prefixed with `$SUDO` variable

### Directory Layout
- **Root level**: Utility scripts for common tasks (IP detection, git automation, updates, server monitoring)
- **`installers/`**: Installation scripts organized by category
  - Direct children: Standalone installers (composer, ansible, docker, LEMP, etc.)
  - **`docker/`**: Docker-related installations (compose, ctop, portainer, Jenkins, Nextcloud)
  - **`kubernetes/`**: Kubernetes setup and tooling
  - **`bash_profile/`**: Shell aliases and bash customizations
  - **`powerline/`**: Powerline shell theme installation
  - **`plex/`**: Plex media server utilities
  - **`raspberry_pi/`**: Raspberry Pi specific installers
  - **`compliance/`**: InSpec and security compliance
  - **`python/`**: Python-related installations
  - **`security/`**: Security tools (CrowdSec, etc.)
- **`sshd/`**: SSH daemon configuration scripts for different security levels
- **`tiling_wm_apps/`**: Tiling window manager applications
- **`inspec/`**: InSpec compliance testing resources
- **`python/`**: Python scripts and utilities
- **`vultr/`**: Vultr VPS-specific utilities

### Key Scripts

**`update.sh`**: System update automation
- Checks for lock files before running
- Runs: `apt-get update`, `upgrade`, `dist-upgrade`, `autoremove`, `autoclean`
- All commands run with `-y` flag (auto-approve)
- Lists packages installed today after completion

**`all-update.sh`**: Comprehensive update orchestrator
- Updates this git repository (`git pull`)
- Runs `update.sh` for system updates
- Updates Docker Portainer containers if installed

**`git_it.sh`**: Git workflow automation
- First run: Initializes repo, downloads standard files (.gitignore, LICENSE, .editorconfig, .gitattributes), reminds to set remote
- Subsequent runs: Stages all changes, commits with timestamp, pushes to remote
- Accepts optional commit message as first argument
- Automatically detects if remote is configured

**`firstrun.sh`**: New server bootstrap
- Installs git, sets German locale (de_DE.UTF-8), sets timezone to Europe/Berlin
- Clones this repository to `~/scripts/bash-scripts`
- Runs `update.sh`, `install_defaults-Non_GUI.sh`, and `configure-sshd-minimum.sh`
- Removes exim4 (mail server on port 25)
- Installs "has" utility for command checking

**`eZServerMonitor.sh`**: Comprehensive server monitoring dashboard
- Displays system info, load average, memory/swap usage, disk usage, network stats, services status, temperatures
- Configurable theme colors and monitored services
- By default monitors: FTP (21), SSH (22), Web (80), Database (3306)
- Pings: google.com, facebook.com, yahoo.com

### Installer Pattern
Installation scripts fetch latest versions using GitHub API:
```bash
compose_version="$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)"
```

Docker-related installers often include docker-compose.yml files for service setup.

## Development Commands

### Testing Scripts
```bash
# Test any script (they're designed to be idempotent)
bash script_name.sh

# Or with execute permission
./script_name.sh
```

### Git Workflow
```bash
# Automated commit and push
./git_it.sh "Your commit message"

# Or automatic timestamp-only commit
./git_it.sh
```

### System Maintenance
```bash
# Update system packages
./update.sh

# Complete update (repo + system + docker)
./all-update.sh
```

### Server Monitoring
```bash
# View comprehensive server status
./eZServerMonitor.sh
```

## Coding Standards

### EditorConfig Settings
- Indent: 2 spaces
- Line endings: LF (Unix)
- Charset: UTF-8
- Trim trailing whitespace
- Insert final newline

### Script Header Template
```bash
#!/usr/bin/env bash

#title:         script_name.sh
#description:   Brief description
#author:        Michael Muyakwa
#created:       YYYY-MM-DD
#updated:       YYYY-MM-DD
#version:       X.Y
#license:       MIT
#usage:         ./script_name.sh
#==============================================================================
```

### SUDO Pattern (Required)
Always include this at the start of scripts that need elevated privileges:
```bash
SUDO=''
[ "$(id -u)" -ne 0 ] && { SUDO='sudo'; echo "Your not root."; echo "Running commands with SUDO."; }
```

Then prefix commands: `$SUDO apt-get install ...`

## Important Notes

- **Target OS**: Debian-based systems (Debian, Ubuntu)
- **Locale**: Scripts default to German locale (de_DE.UTF-8) and Europe/Berlin timezone
- **License**: MIT (see LICENSE file)
- **Safety**: Scripts are intended for development machines, not production systems
- **Auto-approve**: Most package installations use `-y` flag; review before running on important systems
- **GitHub Actions**: Repository includes workflows for releases, tags, Teams alerts, and AI PR review
- **Commit Convention**: Commits via `git_it.sh` include `[ci skip]` tag for automated commits

## Common Patterns to Follow

1. **Check before install**: Use `command -v` to detect if tools are installed
   ```bash
   if [ -x "$(command -v docker)" ]; then
       # docker is installed
   fi
   ```

2. **Directory navigation safety**: Always use `|| exit` after `cd`
   ```bash
   cd /path/to/dir || exit
   ```

3. **File existence checks**:
   ```bash
   [ -f /path/to/file ] && { # file exists }
   [ -d /path/to/dir ] && { # directory exists }
   ```

4. **Version fetching**: Use GitHub API + jq for latest releases
   ```bash
   version="$(curl --silent https://api.github.com/repos/user/repo/releases/latest | jq .name -r)"
   ```
