# PHIVE Install Action
[![CI](https://github.com/ngmy/phive-install-action/actions/workflows/continuous-integration.yml/badge.svg)](https://github.com/ngmy/phive-install-action/actions/workflows/continuous-integration.yml)

PHIVE Install Action is a GitHub Action to download [PHIVE](https://phar.io/), install tools while automatically answering "y" to the "Import this key?" question, and upload them to the artifact store.

## Requirements
PHIVE Install Action has the following requirements:

* Bash
* PHP

## Usage
Use PHIVE Install Action as a step in the job after the checkout step of your repository, as follows:
```yaml
- name: Install tools
  uses: ngmy/phive-install-action@master
```

You can also upload tools to the artifact store for use in subsequent jobs, as follows:
```yaml
jobs:
  install_tools:
    name: Install tools
    runs-on: ubuntu-latest
    steps:
      - name: Check out repository
        uses: actions/checkout@v2
      - name: Install tools
        uses: ngmy/phive-install-action@master
      - name: Upload tools to artifact store
        uses: actions/upload-artifact@master
        with:
          name: tools
          path: tools
  test:
    name: Test
    runs-on: ubuntu-latest
    needs: install_tools
    steps:
      - name: Check out repository
        uses: actions/checkout@v2
      - name: Download tools from artifact store
        uses: actions/download-artifact@master
        with:
          name: tools
          path: tools
      - name: Set tools as an executable
        run: find tools -type f -print0 | xargs -0 chmod +x
```

### Input Parameters
#### phive-arguments
PHIVE Install Action always passes the `--copy` option to the PHIVE `install` command.
If you want to pass additional options or arguments, you can use the `phive-arguments` input parameter.

For example:
```yaml
- name: Install tools
  uses: ngmy/phive-install-action@master
  with:
    phive-arguments: --force-accept-unsigned vendor/unsigned-project
```

#### phive-keyserver
If you want to change the GPG key server to use when installing PHIVE, you can use the `phive-keyserver` input parameter.

For example:
```yaml
- name: Install tools
  uses: ngmy/phive-install-action@master
  with:
    phive-keyserver: hkps://keyserver.ubuntu.com
```

## License
PHIVE Install Action is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).
