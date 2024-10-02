#!/bin/bash

repo_name=$(circleci env subst "${PARAM_REPO_NAME}")
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
