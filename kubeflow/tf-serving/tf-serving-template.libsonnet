{
  local k = import "k.libsonnet",
  local util = import "kubeflow/tf-serving/util.libsonnet",
  new(_env, _params):: {
<<<<<<< HEAD
    local params = _params + _env,
    local namespace = params.namespace,
    local name = params.name,
    local modelName =
      if params.modelName == "null" then
        params.name
      else
        params.modelName,
    local versionName = params.versionName,
    local numGpus =
      if std.type(params.numGpus) == "string" then
        std.parseInt(params.numGpus)
      else
        params.numGpus,
    local modelServerImage =
      if numGpus == 0 then
=======
    local params = _env + _params {
      namespace: if std.objectHas(_params, "namespace") && _params.namespace != "null" then
        _params.namespace else _env.namespace,
    },
    local namespace = params.namespace,
    local name = params.name,
    local modelServerImage =
      if params.numGpus == "0" then
>>>>>>> upstream/v0.3-branch
        params.defaultCpuImage
      else
        params.defaultGpuImage,

    // Optional features.
<<<<<<< HEAD
    // TODO(lunkai): Add request logging

=======
    // TODO(lunkai): Add Istio
    // TODO(lunkai): Add request logging

    local tfService = {
      apiVersion: "v1",
      kind: "Service",
      metadata: {
        labels: {
          app: name,
        },
        name: name,
        namespace: namespace,
        annotations: {
          "getambassador.io/config":
            std.join("\n", [
              "---",
              "apiVersion: ambassador/v0",
              "kind:  Mapping",
              "name: tfserving-mapping-" + name + "-get",
              "prefix: /models/" + name + "/",
              "rewrite: /",
              "method: GET",
              "service: " + name + "." + namespace + ":8000",
              "---",
              "apiVersion: ambassador/v0",
              "kind:  Mapping",
              "name: tfserving-mapping-" + name + "-post",
              "prefix: /models/" + name + "/",
              "rewrite: /model/" + name + ":predict",
              "method: POST",
              "service: " + name + "." + namespace + ":8000",
              "---",
              "apiVersion: ambassador/v0",
              "kind:  Mapping",
              "name: tfserving-predict-mapping-" + name,
              "prefix: tfserving/models/" + name + "/",
              "rewrite: /v1/models/" + name + ":predict",
              "method: POST",
              "service: " + name + "." + namespace + ":8500",
            ]),
        },  //annotations
      },
      spec: {
        ports: [
          {
            name: "grpc-tf-serving",
            port: 9000,
            targetPort: 9000,
          },
          {
            name: "http-tf-serving-proxy",
            port: 8000,
            targetPort: 8000,
          },
          {
            name: "tf-serving-builtin-http",
            port: 8500,
            targetPort: 8500,
          },
        ],
        selector: {
          app: name,
        },
        type: params.serviceType,
      },
    },  // tfService
    tfService:: tfService,

>>>>>>> upstream/v0.3-branch
    local modelServerContainer = {
      command: [
        "/usr/bin/tensorflow_model_server",
      ],
      args: [
        "--port=9000",
        "--rest_api_port=8500",
<<<<<<< HEAD
        "--model_name=" + modelName,
        "--model_base_path=" + params.modelBasePath,
      ] + if util.toBool(params.enablePrometheus) then [
        "--monitoring_config_file=/var/config/monitoring_config.txt",
      ] else [],
      image: modelServerImage,
      imagePullPolicy: "IfNotPresent",
      name: modelName,
=======
        "--model_name=" + params.modelName,
        "--model_base_path=" + params.modelBasePath,
      ],
      image: modelServerImage,
      imagePullPolicy: "IfNotPresent",
      name: name,
>>>>>>> upstream/v0.3-branch
      ports: [
        {
          containerPort: 9000,
        },
        {
          containerPort: 8500,
        },
      ],
      env: [],
      resources: {
        limits: {
          cpu: "4",
          memory: "4Gi",
<<<<<<< HEAD
        } + if numGpus != 0 then {
          "nvidia.com/gpu": numGpus,
=======
        } + if params.numGpus != "0" then {
          "nvidia.com/gpu": params.numGpus,
>>>>>>> upstream/v0.3-branch
        } else {},
        requests: {
          cpu: "1",
          memory: "1Gi",
        },
      },
<<<<<<< HEAD
      volumeMounts: [
        {
          mountPath: "/var/config/",
          name: "config-volume",
        },
      ],
=======
      volumeMounts: [],
>>>>>>> upstream/v0.3-branch
      // TCP liveness probe on gRPC port
      livenessProbe: {
        tcpSocket: {
          port: 9000,
        },
        initialDelaySeconds: 30,
        periodSeconds: 30,
      },
    },  // modelServerContainer

<<<<<<< HEAD
=======
    local httpProxyContainer = {
      name: name + "-http-proxy",
      image: params.httpProxyImage,
      imagePullPolicy: "IfNotPresent",
      command: [
        "python",
        "/usr/src/app/server.py",
        "--port=8000",
        "--rpc_port=9000",
        "--rpc_timeout=10.0",
      ],
      env: [],
      ports: [
        {
          containerPort: 8000,
        },
      ],
      resources: {
        requests: {
          memory: "500Mi",
          cpu: "0.5",
        },
        limits: {
          memory: "1Gi",
          cpu: "1",
        },
      },
      securityContext: {
        runAsUser: 1000,
        fsGroup: 1000,
      },
    },  // httpProxyContainer

>>>>>>> upstream/v0.3-branch
    local tfDeployment = {
      apiVersion: "extensions/v1beta1",
      kind: "Deployment",
      metadata: {
        labels: {
<<<<<<< HEAD
          app: modelName,
=======
          app: name,
>>>>>>> upstream/v0.3-branch
        },
        name: name,
        namespace: namespace,
      },
      spec: {
        template: {
          metadata: {
            labels: {
<<<<<<< HEAD
              app: modelName,
              version: versionName,
            },
            annotations: {
              "sidecar.istio.io/inject": if util.toBool(params.injectIstio) then "true",
=======
              app: name,
>>>>>>> upstream/v0.3-branch
            },
          },
          spec: {
            containers: [
              modelServerContainer,
<<<<<<< HEAD
            ],
            volumes: [
              {
                configMap: {
                  name: name + "-config",
                },
                name: "config-volume",
              },
            ],
=======
            ] + if util.toBool(params.deployHttpProxy) then [
              httpProxyContainer,
            ] else [],
            volumes: [],
>>>>>>> upstream/v0.3-branch
          },
        },
      },
    },  // tfDeployment
    tfDeployment:: tfDeployment,
<<<<<<< HEAD

    local tfservingConfig = {
      apiVersion: "v1",
      kind: "ConfigMap",
      metadata: {
        name: name + "-config",
        namespace: namespace,
      },
      data: {
        "monitoring_config.txt": std.join("\n", [
          "prometheus_config: {",
          "  enable: true,",
          '  path: "/monitoring/prometheus/metrics"',
          "}",
        ]),
      },
    },  // tfservingConfig
    tfservingConfig:: tfservingConfig,
=======
>>>>>>> upstream/v0.3-branch
  },  // new
}
