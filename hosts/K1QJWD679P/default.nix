{ pkgs, ... }:

{
  # The wrapped helm only sees Nix plugins unless HELM_PLUGINS is set; keep the
  # user plugin dir so `helm plugin install` still works (e.g. render).
  environment.variables.HELM_PLUGINS = "$HOME/.local/share/helm/plugins";

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
    (wrapHelm kubernetes-helm {
      plugins = with kubernetes-helmPlugins; [
        helm-diff
        helm-unittest
      ];
    })
    lua-language-server
    prek
    shellcheck
    stern
    tflint
    vault-bin
    yq-go
  ];
}
