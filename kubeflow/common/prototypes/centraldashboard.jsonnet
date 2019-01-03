// @apiVersion 0.1
// @name io.ksonnet.pkg.centraldashboard
// @description centraldashboard Component
// @shortDescription centraldashboard
// @param name string Name
<<<<<<< HEAD:kubeflow/common/prototypes/centraldashboard.jsonnet
// @optionalParam image string gcr.io/kubeflow-images-public/centraldashboard:v0.4.0 Image for the central dashboard
=======
// @optionalParam image string gcr.io/kubeflow-images-public/centraldashboard:v0.3.4 Image for the central dashboard
>>>>>>> upstream/v0.3-branch:kubeflow/core/prototypes/centraldashboard.jsonnet

local centraldashboard = import "kubeflow/common/centraldashboard.libsonnet";
local instance = centraldashboard.new(env, params);
instance.list(instance.all)
