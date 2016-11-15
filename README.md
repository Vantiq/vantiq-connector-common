# Vantiq connector common

This repository holds the common Vantiq artifacts that are available to simplify
the creation of Vantiq connectors and adapters.

## Install

To install the Vantiq connector common, use the Vantiq CLI to import:

    % git clone https://github.com/Vantiq/vantiq-connector-common.git
    % cd vantiq-connector-commmon
    % vantiq -s <profile> import

where `<profile>` provides the credentials for the Vantiq CLI.

## vantiq-import-adapter.sh

In the `bin` directory, the `vantiq-import-adapter.sh` script provides a one step means for
installing a connector or adapter.  The script uses the syntax:

    vantiq-import-adapter.sh <gitURL> <cliOptions>

where `<gitURL>` is the URL used to download the connector or adapter project, 
usually from GitHub and `<cliOptions>` are the options used in the Vantiq CLI
to determine which Vantiq server and namespace to import into.  This would
be equivalent to:

    % git clone <gitURL>
    % cd <gitRepoDirectory>
    % vantiq <cliOptions> import

# Copyright and License

Copyright &copy; 2016 Vantiq, Inc.  Code released under the [MIT License](./LICENSE)