{ pkgs, ... }:

{
  # K1QJWD679P-specific packages.
  environment.systemPackages = with pkgs; [
    _1password-cli
    argocd
    awscli2
    azure-cli
    commitizen
    crossplane-cli
    (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])
    hadolint
    jq
    k9s
    kubectl
    kubectx
    (wrapHelm kubernetes-helm { plugins = [ kubernetes-helmPlugins.helm-diff ]; })
    lua-language-server
    prek
    shellcheck
    stern
    tflint
    vault-bin
    yq-go
  ];
}
