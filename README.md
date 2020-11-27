# Gitflow helper

This can be used in GitLab CI to help you stick to GitFlow.

## Add to GitLab CI YAML

```yaml
include:
  - https://raw.githubusercontent.com/ekreative/gitflow/master/gitflow.yml
```

The include expects to run in a stages `pre_build` and `pre_deploy`, you can customise this,
for example:

```yaml
gitflow:
  stage: test
```

You need to add `GITLAB_API_TOKEN` to CI variables,
with an access token with API access.

## Flow

By default, it will use a flow with 2 main branches
- `dev`
- `master`

All branches will have MRs into `dev`, and `dev` will have MR into `master`.

It will make MRs from master to `dev` if there are changes there, this is so that
you always merge back hotfixes to `dev`.

Branches starting with `hotfix/` will have MR into `master`.

Pipelines on the master branch will create a release in the form `YYYY-MM-DD.PIPELINE_ID`.
The date of the commit is used.

## Configure

For most projects, the defaults will work, but branch names can all be configured:

```shell script
GIT_FLOW_MASTER=master
GIT_FLOW_DEV=dev
GIT_FLOW_HOTFIX=hotfix/
```

Additionally you can add a `test` branch between `dev` and `master`
by setting `GIT_FLOW_TEST=test`.

You can enable auto create merge request for all branches by setting `GIT_FLOW_AUTO_MR=1`.
