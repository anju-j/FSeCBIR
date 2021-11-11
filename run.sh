#!/usr/bin/env bash
set -ex
matlab -nodisplay -r "addpath(genpath('.')); main"
