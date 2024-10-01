#!/bin/bash
# This example uses envsubst to support variable substitution in the string parameter type.
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
# TO=$(circleci env subst "${PARAM_TO}")
# TO="test"
# If for any reason the TO variable is not set, default to "World"
# echo "Hello ${TO:-World}!"


# repo_name="test-repo"
# timestamp=$(date +%s)
# status="TEST"

repo_name=$(circleci env subst "${PARAM_REPO_NAME}")
# job_name=$(circleci env subst "${PARAM_TO}")
timestamp=$(date +%s)
status=$(circleci env subst "${PARAM_JOB_STATUS}")
circleci_job_name=$(circleci env subst "${PARAM_JOB_NAME}")



curl --request POST \
  --url "${BUILD_STATUS_API_URL}" \
  --header 'Content-Type: application/json' \
  --header "x-api-key: ${BUILD_STATUS_API_KEY}" \
  --data '{
  "repo_name": "'"${repo_name}"'",
  "timestamp": "'"${timestamp}"'",
  "status": "'"${status}"'"
  "circleci_job_name": "'"${circleci_job_name}"'"

  }'
