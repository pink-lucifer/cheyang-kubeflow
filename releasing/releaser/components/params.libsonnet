{
  global: {
    // User-defined global parameters; accessible to all component and environments, Ex:
    // replicas: 4,
  },
  components: {
    // Component-level parameters, defined initially from 'ks prototype use ...'
    // Each object below should correspond to a component in the components/ directory
    workflows: {
      bucket: "kubeflow-ci_temp",
      commit: "master",
      name: "new9",
      namespace: "kubeflow-test-infra",
      prow_env: "REPO_OWNER=kubeflow,REPO_NAME=kubeflow,PULL_BASE_SHA=master",
      serving_image: "gcr.io/kubeflow-ci/model-server",
      testing_image: "gcr.io/kubeflow-ci/test-worker:latest",
      tf_testing_image: "gcr.io/kubeflow-ci/tf-test-worker:1.0",
      project: "kubeflow-ci",
      cluster: "kubeflow-testing",
      zone: "us-east1-d",
    },
    centraldashboard: {
<<<<<<< HEAD
      bucket: "kubeflow-ci_temp",
      cluster: "kubeflow-testing",
=======
      bucket: "kubeflow-releasing-artifacts",
      cluster: "kubeflow-releasing",
>>>>>>> upstream/v0.3-branch
      dockerfile: "Dockerfile",
      dockerfileDir: "kubeflow/kubeflow/components/centraldashboard",
      extra_args: "null",
      extra_repos: "kubeflow/testing@HEAD",
      gcpCredentialsSecretName: "gcp-credentials",
      image: "centraldashboard",
      name: "centraldashboard",
<<<<<<< HEAD
      namespace: "kubeflow-ci",
      nfsVolumeClaim: "nfs-external",
      project: "kubeflow-ci",
      prow_env: "REPO_OWNER=kubeflow,REPO_NAME=kubeflow,PULL_BASE_SHA=master",
      registry: "gcr.io/kubeflow-images-public",
      testing_image: "gcr.io/kubeflow-ci/test-worker:latest",
=======
      namespace: "kubeflow-releasing",
      nfsVolumeClaim: "nfs-external",
      project: "kubeflow-releasing",
      prow_env: "REPO_OWNER=kubeflow,REPO_NAME=kubeflow,PULL_BASE_SHA=master",
      registry: "gcr.io/kubeflow-images-public",
      testing_image: "gcr.io/kubeflow-releasing/worker:latest",
>>>>>>> upstream/v0.3-branch
      versionTag: "latest",
      zone: "us-central1-a",
    },
    "pytorch-operator": {
      bucket: "kubeflow-releasing-artifacts",
      cluster: "kubeflow-releasing",
      dockerfile: "Dockerfile",
      dockerfileDir: "kubeflow/pytorch-operator",
      extra_args: "/mnt",
      extra_repos: "kubeflow/testing@HEAD;kubeflow/pytorch-operator@HEAD",
      gcpCredentialsSecretName: "gcp-credentials",
      image: "pytorch-operator",
      name: "pytorch-operator",
      namespace: "kubeflow-releasing",
      nfsVolumeClaim: "nfs-external",
      project: "kubeflow-releasing",
      prow_env: "REPO_OWNER=kubeflow,REPO_NAME=kubeflow,PULL_BASE_SHA=master",
      registry: "gcr.io/kubeflow-images-public",
      testing_image: "gcr.io/kubeflow-releasing/worker:latest",
      versionTag: "latest",
      zone: "us-central1-a",
    },
  },
}
