#!/bin/bash
#
# This is a script to automate updating ksonnet components. Use this script
# to update the image versions after tagging them with run_apply_image_tags.sh.
<<<<<<< HEAD
#
=======
# 
>>>>>>> upstream/v0.3-branch
# Usage:
# update_components.sh component tag
#
# component - The name of the component to update. Supported components are
#             tf-operator, pytorch-operator, katib, centraldashboard, and
#             jupyter-notebooks.
# tag       - The Docker image tag to use.
set -ex

COMPONENT=$1
TAG=$2
<<<<<<< HEAD
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd ${DIR}/.. && pwd)"

# Assume the testing repo is checkout in git_kubeflow_testing because
=======
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="$( cd ${DIR}/.. && pwd )"

# Assume the testing repo is checkout in git_kubeflow_testing because 
>>>>>>> upstream/v0.3-branch
# we depend on the python code in that repo.
export PYTHONPATH=${PYTHONPATH}:${ROOT_DIR}/../git_kubeflow-testing/py

if [ -z "${COMPONENT}" ] || [ -z "${TAG}" ]; then
  echo "Component and tag must be provided"
  echo "Usage: update_components component tag"
  exit 1
fi

if [ "${COMPONENT}" == "tf-operator" ]; then
  echo "Updating TF operator..."
  python scripts/update_prototype.py \
<<<<<<< HEAD
    --file=${ROOT_DIR}/kubeflow/tf-training/prototypes/tf-job-operator.jsonnet \
    --values=tfJobImage=gcr.io/kubeflow-images-public/tf_operator:${TAG}
  echo "Done."

elif [ "${COMPONENT}" == "pytorch-operator" ]; then
  echo "Updating PyTorch operator..."
  python scripts/update_prototype.py \
    --file=${ROOT_DIR}/kubeflow/pytorch-job/prototypes/pytorch-operator.jsonnet \
    --values=pytorchJobImage=gcr.io/kubeflow-images-public/pytorch-operator:${TAG}
=======
	--file=${ROOT_DIR}/kubeflow/tf-training/prototypes/tf-job-operator.jsonnet \
	--values=tfJobImage=gcr.io/kubeflow-images-public/tf_operator:${TAG}
  echo "Done."
 
elif [ "${COMPONENT}" == "pytorch-operator" ]; then
  echo "Updating PyTorch operator..."
  python scripts/update_prototype.py \
	--file=${ROOT_DIR}/kubeflow/pytorch-job/prototypes/pytorch-operator.jsonnet \
	--values=pytorchJobImage=gcr.io/kubeflow-images-public/pytorch_operator:${TAG}  
>>>>>>> upstream/v0.3-branch
  echo "Done."

elif [ "${COMPONENT}" == "katib" ]; then
  echo "Updating Katib..."
<<<<<<< HEAD
  VALUES="suggestionRandomImage=gcr.io/kubeflow-images-public/katib/suggestion-random:${TAG}"
=======
  VALUES="${VALUES},suggestionRandomImage=gcr.io/kubeflow-images-public/katib/suggestion-random:${TAG}"
>>>>>>> upstream/v0.3-branch
  VALUES="${VALUES},suggestionGridImage=gcr.io/kubeflow-images-public/katib/suggestion-grid:${TAG}"
  VALUES="${VALUES},suggestionHyperbandImage=gcr.io/kubeflow-images-public/katib/suggestion-hyperband:${TAG}"
  VALUES="${VALUES},suggestionBayesianOptimizationImage=gcr.io/kubeflow-images-public/katib/suggestion-bayesianoptimization:${TAG}"
  VALUES="${VALUES},vizierCoreImage=gcr.io/kubeflow-images-public/katib/vizier-core:${TAG}"
  VALUES="${VALUES},vizierCoreRestImage=gcr.io/kubeflow-images-public/katib/vizier-core-rest:${TAG}"
  VALUES="${VALUES},katibUIImage=gcr.io/kubeflow-images-public/katib/katib-ui:${TAG}"
  VALUES="${VALUES},studyJobControllerImage=gcr.io/kubeflow-images-public/katib/studyjob-controller:${TAG}"
  VALUES="${VALUES},metricsCollectorImage=gcr.io/kubeflow-images-public/katib/metrics-collector:${TAG}"
  python ${ROOT_DIR}/scripts/update_prototype.py \
<<<<<<< HEAD
    --file=${ROOT_DIR}/kubeflow/katib/prototypes/all.jsonnet \
    --values=${VALUES}
=======
	--file=${ROOT_DIR}/kubeflow/katib/prototypes/all.jsonnet \
	--values=${VALUES}
>>>>>>> upstream/v0.3-branch
  echo "Done."

elif [ "${COMPONENT}" == "centraldashboard" ]; then
  echo "Updating CentralDashboard..."
  python scripts/update_prototype.py \
<<<<<<< HEAD
    --file=${ROOT_DIR}/kubeflow/core/prototypes/centraldashboard.jsonnet \
    --values=image=gcr.io/kubeflow-images-public/centraldashboard:${TAG}
=======
	--file=${ROOT_DIR}/kubeflow/core/prototypes/centraldashboard.jsonnet \
	--values=image=gcr.io/kubeflow-images-public/centraldashboard:${TAG}   
>>>>>>> upstream/v0.3-branch
  echo "Done."

elif [ "${COMPONENT}" == "jupyter-notebooks" ]; then
  echo "Updating Jupyter notebooks..."
  sed -i "s/tensorflow-\([0-9\.]*\)-notebook-\(.*\):v[0-9\.]*/tensorflow-\1-notebook-\2:${TAG}/" \
<<<<<<< HEAD
    kubeflow/jupyter/ui/default/config.yaml
=======
	kubeflow/core/ui/default/config.yaml
>>>>>>> upstream/v0.3-branch
  echo "Done."

else
  echo "Component ${COMPONENT} is unsupported."
fi
