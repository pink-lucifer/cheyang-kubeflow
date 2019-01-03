<<<<<<< HEAD
#!/usr/bin/env bash
=======
#!/bin/bash
>>>>>>> upstream/v0.3-branch
#
# Fetch Katib image shas from GCR and them to image_tags.yaml
#
set -ex
<<<<<<< HEAD
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd ${DIR}/.. && pwd)"

IMAGES_FILE=${ROOT_DIR}/releasing/image_tags.yaml

# Assume the testing repo is checkout in git_kubeflow_testing because
=======
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="$( cd ${DIR}/.. && pwd )"

IMAGES_FILE=${ROOT_DIR}/releasing/image_tags.yaml

# Assume the testing repo is checkout in git_kubeflow_testing because 
>>>>>>> upstream/v0.3-branch
# we depend on the python code in that repo.
export PYTHONPATH=${PYTHONPATH}:${ROOT_DIR}/../git_kubeflow-testing/py

KATIB_TAG=v0.1.2-alpha-34-gb46378c

# Fetch shas for Jupyter images
python ${ROOT_DIR}/releasing/add_image_shas.py --pattern=.*katib/.*:${KATIB_TAG} \
<<<<<<< HEAD
  --images_file=${IMAGES_FILE}
=======
	--images_file=${IMAGES_FILE}
>>>>>>> upstream/v0.3-branch
